# frozen_string_literal: true

class Hospital < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :location
  has_many :hospital_statuses

  def self.on_divert
    divert = []
    Hospital.find_each do |hospital|
      if hospital&.hospital_statuses&.count >= 1
        divert << hospital unless hospital&.last_status_expired?
      end
    end
    divert
  end

  def last_status_expired?
    hospital_statuses.present? && hospital_statuses&.last&.expired?
  end

  def status
    last_status_expired? ? NullHospitalStatus.new : hospital_statuses&.last
  end
end
