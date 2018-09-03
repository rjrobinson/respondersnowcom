require 'rails_helper'

feature 'Responder can log in to application', %(
  As an Responder
  I want to be able to See my profile
  So that I can update my settings

) do

  user_log_in

  describe "Reponders Actions" do

    let(:user) {User.first}
    let(:other_responder) {User.create(
        first_name: 'Other',
        last_name: 'Responder')
    }

    scenario 'Responder can view profile' do

      visit edit_responder_path(responder)

      expect(page).to have_content "Responder Profile"
    end

    scenario 'Responder will get an error message when trying to view other users' do

      visit edit_responder_path(other_responder)

      expect(page).not_to have_content "Responder Profile"

    end
  end
end