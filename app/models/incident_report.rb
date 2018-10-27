# frozen_string_literal: true

class IncidentReport < ApplicationRecord
  belongs_to :user
  belongs_to :incident
end
