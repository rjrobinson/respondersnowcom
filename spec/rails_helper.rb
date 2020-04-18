# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require_relative './shared_types'
require 'simplecov'

SimpleCov.start 'rails' do
  add_filter 'app/controllers/'
  add_filter 'app/errors/stripe_errors.rb'
  add_filter 'app/graphql/resnow_schema.rb'
  add_filter 'app/helpers/states_helper.rb'
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/mailers/application_mailer.rb'
  add_filter 'app/models/application_record.rb'
  add_filter 'app/views/'
  # TODO: below needs to be revisted at another time.
  add_filter 'app/errors/stripe_errors.rb'
  add_filter 'app/helpers/application_helper.rb'
  add_filter 'app/helpers/error_messages_helper.rb'
  add_filter 'app/jobs/clear_incident_job.rb'
  add_filter 'app/jobs/hospital_status_job.rb'
  add_filter 'app/mailers/example_mailer.rb'
  add_filter 'app/models/ahoy/event.rb'
  add_filter 'app/models/ahoy/visit.rb'
  add_filter 'app/models/merit/rank_rules.rb'
  add_filter 'app/models/subscription.rb'
  add_filter 'lib/tasks/get_classes_nj.rb'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'database_cleaner'
require 'support/sign_in_helper'
require 'support/omniauth'

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)

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
  config.example_status_persistence_file_path = "#{::Rails.root}/spec/"
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
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
