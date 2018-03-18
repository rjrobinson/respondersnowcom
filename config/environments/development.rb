Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.assets.quiet = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
        'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_deliveries = true

  config.action_mailer.perform_caching = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  config.assets.quiet = true

  config.action_mailer.default_url_options = {host: 'localhost', port: 3000}

  # MAIL SETTINGS
  config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #     address: 'smtp.gmail.com',
  #     port: 587,
  #     domain: 'respondersnow.com',
  #     authentication: :plain,
  #     enable_starttls_auto: true,
  #     user_name: ENV['GMAIL_USERNAME'],
  #     password: ENV['GMAIL_PASSWORD']
  # }

  # config.action_mailer.smtp_settings = {:address => 'localhost', :port => 1025}

  config.action_mailer.smtp_settings = {
      address: 'smtp.mandrillapp.com',
      authentication: :plain,
      domain: 'respondersnow.com',
      enable_starttls_auto: true,
      port: 25,
      port: "587",
      user_name: ENV['MANDRILL_USERNAME'],
      password: ENV['MANDRILL_API_KEY']
  }
  config.action_mailer.default_url_options = {host: 'respondersnow.com'}
end
