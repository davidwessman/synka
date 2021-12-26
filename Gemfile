# frozen_string_literal: true

def next?
  File.basename(__FILE__) == "Gemfile.next"
end

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.7.2"

gem "rails", "~> 7.0"
gem "sprockets-rails", "~> 3.4"

gem "bootsnap", require: false
gem "clearance"
gem "nexmo_rails"
gem "cssbundling-rails", "~> 1.0.0"
gem "jsbundling-rails", "~> 1.0.0"
gem "pg"
gem "puma"
gem "roadie-rails"
gem "sidekiq"
gem "turbolinks"
gem "twilio-ruby"
gem "uglifier"

group :development, :test do
  gem "blinka-reporter", "~> 0.4.0"
  gem "capybara"
  gem "dotenv-rails"
  gem "selenium-webdriver"
  gem "sinatra"
end

group :development do
  gem "htmlbeautifier"
  gem "letter_opener"
  gem "standardrb"
end

group :test do
  gem "webdrivers", "~> 5.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
