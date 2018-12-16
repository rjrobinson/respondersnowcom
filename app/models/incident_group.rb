# frozen_string_literal: true

class IncidentGroup < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :incidents
end
