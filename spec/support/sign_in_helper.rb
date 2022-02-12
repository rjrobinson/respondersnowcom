# frozen_string_literal: true

def user_sign_in
  visit "users/auth"

  fill_in :responder_email, with: @user.email
  fill_in :responder_password, with: @user.password

  click_on "Sign in"
end

def user_log_in_with_omniauth
  background do
    omniauth

    visit root_path

    click_on "Sign In / Sign Up"

    click_link_or_button "Sign in with Facebook"
  end
end
