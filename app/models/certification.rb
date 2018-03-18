class Certification < ApplicationRecord

  belongs_to :creator, polymorphic: true

  validates :name, presence: true

end