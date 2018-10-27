# frozen_string_literal: true

class IncidentType < ApplicationRecord
  has_many :incidents
end
