require 'rails_helper'

feature 'Responder can log in to application', %(
  As an Responder
  I want to be able to add certifications to my profile
  So that I can increase my ResponderScore

) do

  # let(:agency) { FactoryBot.create(:agency) }

  user_log_in

  scenario 'Responder adds certification' do

    click_on 'Certifications'

  end
end