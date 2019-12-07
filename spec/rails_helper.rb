# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
require 'coveralls'

SimpleCov.start 'rails' do
  add_filter 'app/mailers/application_mailer.rb'
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/views/'
  add_filter 'app/controllers/'
  add_filter 'app/controllers/appviews_controller.rb'
  add_filter 'app/controllers/commerce_controller.rb'
  add_filter 'app/controllers/cssanimations_controller.rb'
  add_filter 'app/controllers/forms_controller.rb'
  add_filter 'app/controllers/gallery_controller.rb'
  add_filter 'app/controllers/graphs_controller.rb'
  add_filter 'app/controllers/gridoptions_controller.rb'
  add_filter 'app/controllers/landing_controller.rb'
  add_filter 'app/controllers/layoutsoptions_controller.rb'
  add_filter 'app/controllers/mailbox_controller.rb'
  add_filter 'app/controllers/metrics_controller.rb'
  add_filter 'app/controllers/miscellaneous_controller.rb'
  add_filter 'app/controllers/pages_controller.rb'
  add_filter 'app/controllers/tables_controller.rb'
  add_filter 'app/controllers/uielements_controller.rb'
  add_filter 'app/controllers/widgets_controller.rb'
  add_filter 'app/graphql/'
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

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

end


def here
  binding.pry
end
