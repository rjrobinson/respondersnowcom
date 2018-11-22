# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  default from: "RespondersNOW [SUPPORT] <no-reply@respondersnow.com>"
  default to: "robertj.robinson@gmail.com"

  def new_user(user:)
    @user = user
    mail(
      subject: "New User: #{user.email}"
    )
  end
end
