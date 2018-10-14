class IncidentReport < ApplicationRecord
  belongs_to :user
  belongs_to :icident
end
