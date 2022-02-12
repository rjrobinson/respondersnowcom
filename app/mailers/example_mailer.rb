# frozen_string_literal: true

class ExampleMailer < ApplicationMailer
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: "Sample Email")
  end

  def welcome(user_id)
    user = User.find(user_id)
    subject = "Welcome to our awesome app!"
    merge_vars = {
      "FIRST_NAME" => user.first_name,
      "USER_URL" => user_url(user)
    }
    body = mandrill_template("welcome", merge_vars)

    send_mail(user.email, subject, body)
  end
end
