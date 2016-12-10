class AquiredCertification < ApplicationRecord

  belongs_to :responder
  belongs_to :certification

  validates :number, uniqueness: true
end
