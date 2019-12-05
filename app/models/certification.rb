# frozen_string_literal: true

class Certification < ApplicationRecord
  CODES = ["FIRE", "EMS", "HAZMAT", "TECHNICAL RESCUE", "FEMA", "EMD"].sort.freeze

  belongs_to :creator, polymorphic: true

  validates :name, presence: true, uniqueness: true

  has_one_attached :logo

  scope :primaries, -> { where(primary: true).order(:name) }

  scope :secondary, -> { where(primary: false).order(:name) }
end
