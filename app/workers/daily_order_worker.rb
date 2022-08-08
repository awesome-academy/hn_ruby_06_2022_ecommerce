class DailyOrderWorker
  include Sidekiq::Worker

  def perform
    UserMailer.daily_order.deliver_now
  end
end
