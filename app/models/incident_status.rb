# frozen_string_literal: true

class IncidentStatus < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
