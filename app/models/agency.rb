class Agency < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :location
  # validates :email, presence: true, uniqueness: true

end
