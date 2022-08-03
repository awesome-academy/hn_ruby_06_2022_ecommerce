source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.1"

gem "active_storage_validations", "~> 0.8"
gem "bcrypt", "3.1.13"
gem "bootstrap-sass", "3.4.1"
gem "cancancan"
gem "config"
gem "devise", "~> 4.1"
gem "faker"
gem "figaro"
gem "font-awesome-rails"
gem "font-awesome-sass", "~> 4.7.0"
gem "htmlbeautifier"
gem "i18n-js"
gem "image_processing", "~> 1.2"
gem "jbuilder", "~> 2.7"
gem "mysql2", "~> 0.5"
gem "pagy"
gem "pry-rails"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.6"
gem "rails-i18n"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "rspec-rails", "~> 4.0.1"
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "database_cleaner"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov"
  gem "simplecov-rcov"
  gem "webdrivers"
end
