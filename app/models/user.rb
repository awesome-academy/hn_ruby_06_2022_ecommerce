class User < ApplicationRecord
  enum role: {admin: 0, customer: 1}
  attr_accessor :activation_token, :reset_token

  USER_ATTRS = %w(name email password password_confirmation).freeze
  GET_ALL = %w(id name email phone_num address).freeze
  UPDATE_ATTRS = %w(name email password password_confirmation phone_num address
                  avatar).freeze
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  before_save :downcase_email
  before_create :create_activation_digest

  validates :email, presence: true,
    format: {with: Settings.user.VALID_EMAIL_REGEX},
    uniqueness: true

  validates :name, presence: true,
    length: {maximum: Settings.user.name_validates.name_max_length,
             minimum: Settings.user.name_validates.name_min_length}

  validates :password, presence: true,
    length: {minimum: Settings.user.password_validates.password_min_length},
    if: :password, allow_nil: true

  validates :address, length: {minimum: Settings.user.address_min_length,
                               maximum: Settings.user.address_max_length},
                               allow_nil: true

  validates :phone_num, length: {minimum: Settings.user.min_phone,
                                 maximum: Settings.user.max_phone},
                                 allow_nil: true

  validates :avatar,
            content_type: {in: Settings.user.image.image_path,
                           message: :wrong_format},
                          allow_nil: true
  has_secure_password

  scope :asc_name, ->{order name: :asc}
  scope :get_all, ->{select(GET_ALL).where(role: :customer)}

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password? token
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_columns reset_digest: User.digest(reset_token),
                   reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < Settings.user.password_reset.password_time.hours.ago
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
