# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'coffee-rails' # Remove when not using 5-2-stable
gem 'rails', git: 'https://github.com/rails/rails', branch: '5-2-stable'

gem 'bootsnap'
gem 'clearance'
gem 'font-awesome-rails'
gem 'koala'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'turbolinks'
gem 'uglifier'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'pry-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'dotenv-rails'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
