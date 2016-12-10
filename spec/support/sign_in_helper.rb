def responder_sign_in
  visit 'responders/auth'

  fill_in :responder_email, with: @responder.email
  fill_in :responder_password, with: @responder.password

  click_on 'Sign in'
end

def responder_log_in
  background do
    set_omniauth
    visit root_path
    click_on 'Responder Login'
    click_link_or_button 'Sign in with Facebook'
  end
end