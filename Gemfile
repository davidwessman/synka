# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.6.3"

gem "rails", "~> 5.2"

gem "bootsnap", require: false
gem "clearance"
gem "font-awesome-sass"
gem "koala"
gem "pg"
gem "puma"
gem "roadie-rails"
gem "sidekiq"
gem "turbolinks"
gem "twilio-ruby"
gem "uglifier"
gem "sass-rails", github: 'rails/sass-rails', tag: 'v6.0.0.beta3'
gem "webpacker"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "pry-rails"
  gem "selenium-webdriver"
  gem "sinatra"
  gem "webmock"
end

group :development do
  gem "dotenv-rails"
  gem "htmlbeautifier"
  gem "standardrb"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
