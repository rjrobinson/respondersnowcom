require 'rails_helper'

feature 'Responder can log in to application', %(
  As an Responder
  I want to be able to create an account
  So that I can log in to the application
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

    user = User.first
    user.confirm!


    expect(page).to have_content 'Congrate'

  end
end
