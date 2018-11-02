ActionMailer::Base.smtp_settings = {
    address: 'smtp.mandrillapp.com',
    authentication: 'login',
    domain: 'respondersnow.com',
    enable_starttls_auto: true,
    port: "587",
    user_name: ENV['SMTP_USERNAME'],
    password: ENV['SMTP_API_KEY'],
    enable_starttls_auto: true
}


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'