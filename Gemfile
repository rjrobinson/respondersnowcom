# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails', '~> 5.2.0'
gem 'webpacker', '~> 3.5'
gem 'bootstrap-sass'
gem 'font-awesome-rails'

gem 'dotenv-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'bootstrap', '~> 4.1.3'
gem 'sprockets-rails'
gem 'jquery-rails', '~> 4.3.1'

gem 'jquery-ui-rails'
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'simple_form'
gem 'devise'
gem 'omniauth-facebook'

gem 'activerecord-typedstore'
gem 'chronic'


#  Background Jobs
gem 'sidekiq'


# HOSPITAL DATA SYNC
gem 'selenium-webdriver'
gem 'webdrivers'
gem 'chromedriver-helper'

# Weather
gem 'gull'

# Stripe Payment Processing
gem 'stripe', git: 'https://github.com/stripe/stripe-ruby'

# Email
gem 'mandrill-api'

# Active Storage
gem 'aws-sdk-s3', '~> 1'


# GraphQL
gem 'graphql'
gem 'graphiql-rails'
gem 'graphql-batch'


# Google Ads
gem 'ads-rails'


# Merit
gem 'merit'

#  Analytics
gem 'ahoy_matey'
gem 'groupdate'
gem 'chartkick'


# Monitoring Tools
gem 'newrelic_rpm'

# Document Tools
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# LOCATIONS
gem 'geocoder'
gem 'area'
#
gem 'coveralls', require: false

gem 'rails-jquery-autocomplete'

gem 'select2-rails'
gem 'mapbox-rails'

group :development, :test do
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec', require: false
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_bot' # 1ab39#1ab39
  gem 'launchy'
  gem 'rspec_junit_formatter', '0.2.2'
  gem 'brakeman', require: false
  gem 'rubocop'
  gem 'rubocop-rails_config'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'meta_request'
  # gem 'quiet_assets'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'simplecov', require: false, group: :test


ruby '2.4.1'

gem 'bugsnag', '~> 6.8'
