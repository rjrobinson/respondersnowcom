class Incident < ApplicationRecord

  has_one :location
  has_one :incident_type

  has_many :votes
  has_many :incident_confirmeds
  has_many :incident_flags

  has_many :incident_reports

end
