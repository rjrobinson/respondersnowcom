require 'rails_helper'

feature 'Responder can log in to application', %(
  As an Responder
  I want to be able to add work history to my profile
  So that I can increase my ResponderScore

) do

  let(:agency) { FactoryGirl.create(:agency) }

  responder_log_in

  scenario 'Responder adds Work History' do
    agency = FactoryGirl.create(:agency)

    click_on 'Work History'

    select agency.name, from: 'work_history_agency_id'

    select 'January', from: 'work_history_start_date_2i' # The manner in which we populate teh date time for the field requires the suffix
    select '2001', from: 'work_history_start_date_1i'

    select 'January', from: 'work_history_start_date_2i'
    select '2006', from: 'work_history_start_date_1i'

    select 'EMT' # , from: 'work_history_title'

    select 'Full Time' #, from: 'work_history_status'

    click_on 'Save'

    expect(page).to have_content agency.name
  end
end