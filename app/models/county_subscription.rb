# frozen_string_literal: true

class CountySubscription < ApplicationRecord
  belongs_to :user
  belongs_to :county

  # relate incidents to counties
end
