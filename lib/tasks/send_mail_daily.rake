require "rake"
namespace :task_namespace do
  desc "task description"
  task send_mail_daily: :environment do
    DailyOrderWorker.perform_async
  end
end
