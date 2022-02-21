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

gem "bootsnap", "~> 1.10.3", require: false
gem "clearance", "~> 2.5.0"
gem "nexmo_rails", "~> 1.0.0"
gem "cssbundling-rails", "~> 1.1.0"
gem "jsbundling-rails", "~> 1.0.1"
gem "pg", "~> 1.3.2"
gem "puma", "~> 5.6.2"
gem "roadie-rails", "~> 3.0.0"
gem "sidekiq", "~> 6.4.1"
gem "turbolinks", "~> 5.2.1"
gem "uglifier", "~> 4.2.0"

group :development, :test do
  gem "blinka-reporter", "~> 0.5.2"
  gem "capybara", "~> 3.36.0"
  gem "dotenv-rails", "~> 2.7.6"
  gem "selenium-webdriver", "~> 4.1.0"
  gem "sinatra", "~> 2.2.0"
end

group :development do
  gem "htmlbeautifier", "~> 1.4.1"
  gem "letter_opener", "~> 1.7.0"
  gem "standardrb", "~> 1.0.1"
end

group :test do
  gem "webdrivers", "~> 5.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
