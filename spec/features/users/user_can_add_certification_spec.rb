# frozen_string_literal: true

require 'rails_helper'

feature 'User can log in to application', %(
  As an User
  I want to be able to add certifications to my profile
  So that I can increase my UserScore

) do

  user_log_in_with_omniauth

  scenario 'User adds certification' do
    click_on 'Certifications'
  end
end
