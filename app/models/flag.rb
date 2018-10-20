class Flag < ApplicationRecord

  INCIDENT_FLAG_TYPES = "Inappropriate"

  belongs_to :flagable, polymorphic: true
  belongs_to :user


  validates :flagable, uniqueness: {scope: :user}
  validates :user, uniqueness: {scope: :flagable}

  validates_presence_of :reason

end
