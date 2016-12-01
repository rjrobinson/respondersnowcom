def responder_sign_in
  visit 'responders/auth'

  fill_in :responder_email, with: @responder.email
  fill_in :responder_password, with: @responder.password

  click_on 'Sign in'
end