class CountySubscription < ApplicationRecord
  belongs_to :user
  belongs_to :county
end
