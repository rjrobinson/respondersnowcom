# frozen_string_literal: true

class County < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
end
