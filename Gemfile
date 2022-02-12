# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.7.5"

gem "rails", "~> 6.1.4"
gem "webpacker", "~> 6.rc"


gem "font-awesome-rails"

gem "dotenv-rails"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 5.6"

gem "bootsnap", ">= 1.4.2"

gem "coffee-rails"
gem "uglifier"

gem "bootstrap"
gem "jquery-rails"
gem "sprockets-rails"

gem "jbuilder"
gem "jquery-ui-rails"

# Use Redis adapter to run Action Cable in production
gem "redis"

# Use ActiveModel has_secure_password
gem "activerecord-typedstore"
gem "bcrypt"
gem "chronic"
gem "devise"
gem "omniauth-facebook"
gem "semantic"
gem "simple_form"
gem "skylight"

#  Background Jobs
gem "sidekiq"

gem "rails_admin"

# Weather
gem "gull"

# Stripe Payment Processing
gem "stripe", git: "https://github.com/stripe/stripe-ruby"

# Email
gem "mandrill-api"

# Active Storage
gem "aws-sdk-s3"

# GraphQL
gem "graphiql-rails"
gem "graphql"
gem "graphql-batch"

# # Google Ads
# gem 'ads-rails'

# Merit
gem "merit"

#  Analytics
gem "ahoy_matey"
gem "chartkick", ">= 3.3.0"
gem "groupdate"

# Monitoring Tools
gem "newrelic_rpm"

# Document Tools.
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem "mapbox-rails"
# LOCATIONS
gem "area"
gem "geocoder"
gem "travis"

gem "sqreen", "~> 1.20"

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman", require: false
  gem "byebug", platform: :mri
  gem "database_cleaner"
  gem "factory_bot" # 1ab39#1ab39
  gem "faker", git: "https://github.com/stympy/faker.git", branch: "master"
  gem "guard"
  gem "guard-rails"
  gem "guard-rspec", require: false
  # gem 'guard-spring'
  gem "launchy"
  gem "pry-rails"
  gem "rspec-graphql_matchers"
  gem "rspec_junit_formatter", "0.2.2"
  gem "rspec-rails", "~> 3.5"
  gem "rubocop"
  gem "rubocop-graphql"
  gem "rubocop-rails_config"
  gem "rubocop-rake"
  gem "rubocop-rspec"
  gem "shoulda-matchers", "~> 3.1"
  gem "terminal-notifier"
  gem "terminal-notifier-guard"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "listen", "~> 3.0.5"
  gem "spring-commands-rspec"
  gem "web-console"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "meta_request"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  # gem 'quiet_assets'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "simplecov", require: false, group: :test
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]




