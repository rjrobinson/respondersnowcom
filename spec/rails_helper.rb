# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
require 'coveralls'

SimpleCov.start 'rails' do
  add_filter '/controllers/*'
  add_filter 'app/mailers/application_mailer.rb'
  add_filter 'app/jobs/application_job.rb'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'support/factory_girl'
require 'support/sign_in_helper'
require 'support/omniauth'

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)

  Coveralls.wear! 'rails'
else
  SimpleCov.coverage_dir('coverage')
end


ActiveRecord::Migration.maintain_test_schema!


Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
    with.library :action_controller

    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end


def here
  binding.pry
end