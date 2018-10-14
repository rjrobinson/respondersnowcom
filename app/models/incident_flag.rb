class IncidentFlag < ApplicationRecord

  INCIDENT_FLAG_TYPES = "Inappropriate"

  belongs_to :incident
  belongs_to :user


  validates :incident, uniqueness: {scope: :user}
  validates :user, uniqueness: {scope: :incident}

  validates_presence_of :reason

end
