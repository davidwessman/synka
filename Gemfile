# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.7.1"

gem "rails", "~> 6.0"

gem "bootsnap", require: false
gem "clearance"
gem "font-awesome-sass"
gem "nexmo_rails"
gem "pg"
gem "puma"
gem "roadie-rails"
gem "sassc-rails"
gem "sidekiq"
gem "turbolinks"
gem "twilio-ruby"
gem "uglifier"
gem "webpacker"

group :test do
  gem "webdrivers", "~> 4.5"
end

group :development, :test do
  gem "blinka-reporter", "~> 0.3.0"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "dotenv-rails"
  gem "pry-rails"
  gem "selenium-webdriver"
  gem "sinatra"
end

group :development do
  gem "foreman"
  gem "htmlbeautifier"
  gem "letter_opener"
  gem "solargraph"
  gem "standardrb"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
