class UserMailer < ApplicationMailer
  def canceled_order order
    @order = order
    mail to: @order.user.email, subject: t(".subject_canceled")
  end

  def accepted_order order
    @order = order
    mail to: @order.user.email, subject: t(".subject_accepted")
  end

  def complete_order order
    @order = order
    mail to: @order.user.email, subject: t(".subject_complete")
  end

  def account_activation user
    @user = user
    mail to: user.email, subject: t(".account")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t(".password_r")
  end
end
