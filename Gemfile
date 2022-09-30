# frozen_string_literal: true

def next?
  File.basename(__FILE__) == "Gemfile.next"
end

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "3.0.3"

gem "rails", "~> 7.0"
gem "sprockets-rails", "~> 3.4"

gem "bootsnap", "~> 1.13.0", require: false
gem "clearance", "~> 2.6.1"
gem "nexmo_rails", "~> 1.0.0"
gem "cssbundling-rails", "~> 1.1.1"
gem "jsbundling-rails", "~> 1.0.3"
gem "pg", "~> 1.4.3"
gem "puma", "~> 5.6.5"
gem "roadie-rails", "~> 3.0.0"
gem "sidekiq", "~> 6.5.7"
gem "turbolinks", "~> 5.2.1"
gem "uglifier", "~> 4.2.0"

group :development, :test do
  gem "blinka-reporter", "~> 0.7.0"
  gem "capybara", "~> 3.37.1"
  gem "dotenv-rails", "~> 2.8.1"
  gem "selenium-webdriver", "~> 4.5.0"
  gem "sinatra", "~> 3.0.1"
end

group :development do
  gem "htmlbeautifier", "~> 1.4.2"
  gem "letter_opener", "~> 1.8.1"
  gem "standardrb", "~> 1.0.1"
end

group :test do
  gem "webdrivers", "~> 5.2"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
