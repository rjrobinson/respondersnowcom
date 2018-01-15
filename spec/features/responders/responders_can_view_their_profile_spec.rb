require 'rails_helper'

feature 'Responder can log in to application', %(
  As an Responder
  I want to be able to See my profile
  So that I can update my settings

) do

  responder_log_in

  describe "Reponders Actions" do

    let(:responder) {Responder.first}
    let(:other_responder) {Responder.create(
        first_name: 'Other',
        last_name: 'Responder')
    }

    scenario 'Responder can view profile' do

      visit edit_responder_path(responder)

      expect(page).to have_content "Responder Profile"
    end

    scenario 'Responder will get an error message when trying to view other responders' do

      visit edit_responder_path(other_responder)

      expect(page).not_to have_content "Responder Profile"

    end
  end
end