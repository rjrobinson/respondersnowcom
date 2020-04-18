# frozen_string_literal: true

unless Rails.env.test?
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.mandrillapp.com',
    authentication: 'login',
    domain: 'respondersnow.com',
    port: "587",
    user_name: Rails.application.credentials.mandrill[:smtp_username],
    password: Rails.application.credentials.mandrill[:smtp_api_key], # SMTP password is any valid API key
    enable_starttls_auto: true,
  }

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default(charset: 'utf-8')
end
