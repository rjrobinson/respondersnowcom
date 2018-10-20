class Hospital < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  belongs_to :location
  has_many :hospital_statuses


  def last_status_expired?
    true unless hospital_statuses&.last&.expired?
  end

end
