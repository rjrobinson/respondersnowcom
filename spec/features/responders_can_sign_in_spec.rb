require 'rails_helper'

feature 'Responder can log in to application', %(
  As an Responder
  I want to be able to create an account
  So that I can log in to the application

  A user will also get an email. And be able to sign in.
) do


  scenario 'user goes through domain view' do

    visit 'landing/index'
    expect(page).to have_content 'Responder Login'

    click_on 'Responder Login'

    click_on 'Create Account'

    fill_in :responder_first_name, with: 'Tony'
    fill_in :responder_last_name, with: 'Stark'

    fill_in :responder_email, with: 'tstark@avengers.org'

    fill_in :responder_password, with: 'IronManRox'
    fill_in :responder_password_confirmation, with: 'IronManRox'

    click_on 'Sign up'

    responder = Responder.first
    responder.confirm

    fill_in :responder_email, with: 'tstark@avengers.org'
    fill_in :responder_password, with: 'IronManRox'

    click_on 'Sign in'

    save_and_open_page

    expect(page).to have_content 'Welcome Tony'

  end
end
