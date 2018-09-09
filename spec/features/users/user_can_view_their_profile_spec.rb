require 'rails_helper'

feature 'User can log in to application', %(
  As an User
  I want to be able to See my profile
  So that I can update my settings

) do

  user_log_in

  describe "User Actions" do

    let(:user) {User.first}
    let(:other_user) {User.create(
        first_name: 'Other',
        last_name: 'User')
    }

    scenario 'User can view profile' do

      visit edit_user_path(user)

      expect(page).to have_content user.name
    end

    scenario 'User will get an error message when trying to view other users' do

      visit edit_user_path(other_user)

      expect(page).not_to have_content "Other User Profile"

    end
  end
end