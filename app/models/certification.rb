class Certification < ApplicationRecord

  belongs_to :creator, polymorphic: true

  validates :name, presence: true

  scope :primaries, -> {where(primary: true).order(:name)}


end