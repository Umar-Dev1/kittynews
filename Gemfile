# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 5.1'
gem 'pg'
gem 'rails'

gem 'puma', '5.0.4'
gem 'sass-rails', '6.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '5.1.1'

gem 'devise'
gem 'jquery-rails'

gem 'validate_url'

gem 'graphiql-rails'
gem 'graphql'
gem 'graphql-batch'

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'dotenv-rails', github: 'bkeepers/dotenv'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
