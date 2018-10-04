# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'rails', '~> 5.2'

gem 'bootsnap', require: false
gem 'clearance'
gem 'font-awesome-rails'
gem 'koala'
gem 'pg'
gem 'puma'
gem 'roadie-rails'
gem 'sass-rails'
gem 'sidekiq'
gem 'turbolinks'
gem 'uglifier'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'pry-rails'
  gem 'selenium-webdriver'
  gem 'sinatra'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
