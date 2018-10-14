class Incident < ApplicationRecord

  belongs_to :location
  belongs_to :incident_type
  belongs_to :user

  has_many :votes
  has_many :incident_confirmeds
  has_many :incident_flags

  has_many :incident_reports

end
