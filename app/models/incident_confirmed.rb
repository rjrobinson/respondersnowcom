class IncidentConfirmed < ApplicationRecord

  belongs_to :incident
  belongs_to :user

  validates :incident, uniqueness: {scope: :user}
  validates :user, uniqueness: {scope: :incident}

end
