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

if next?
  gem "rails", "~> 6.1"
else
  gem "rails", "~> 6.0"
end

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

group :development, :test do
  gem "blinka-reporter", "~> 0.3.5"
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

group :test do
  gem "webdrivers", "~> 4.6"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
