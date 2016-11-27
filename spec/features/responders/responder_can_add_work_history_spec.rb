require 'rails_helper'

feature 'Responder can log in to application', %(
  As an Responder
  I want to be able to add work history to my profile
  So that I can increase my ResponderScore

) do


  scenario 'Responder adds Work History' do
    @responder = FactoryGirl.create(:responder)
    
    responder_sign_in

    click_on 'Work History'

    click_on 'Add New'

    select 'FDNY', from: 'agencies'

    select '2010/01/01', from: 'start_date'
    select '2011/01/01', from: 'end_date'

    select 'FF/EMT', from: 'title'

    select 'Full-Time', from: 'status'

    click_on 'Add Work History'

    expect(page).to have_content 'Work History Added'
  end
end