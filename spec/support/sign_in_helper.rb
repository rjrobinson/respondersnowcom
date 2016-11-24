def sign_in_as(user)

  # ONLY WORKS FOR RESPONDER FOR NOW.
  save_and_open_page
  fill_in :responder_email, with: user.email
  fill_in :responder_password, with: user.password

  click_on 'Sign in'
end