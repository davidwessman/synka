# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.6.3"

gem "rails", "~> 6.0"

gem "bootsnap", require: false
gem "clearance"
gem "font-awesome-sass"
gem "pg"
gem "puma"
gem "roadie-rails"
gem "sidekiq"
gem "turbolinks"
gem "twilio-ruby"
gem "uglifier"
gem "sass-rails", ">= 6"
gem "webpacker"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "pry-rails"
  gem "selenium-webdriver"
  gem "sinatra"
end

group :development do
  gem "dotenv-rails"
  gem "letter_opener"
  gem "htmlbeautifier"
  gem "procodile"
  gem "standardrb"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
