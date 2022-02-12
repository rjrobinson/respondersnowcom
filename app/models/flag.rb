# frozen_string_literal: true

class Flag < ApplicationRecord
  INCIDENT_FLAG_TYPES = "Inappropriate"

  belongs_to :flaggable, polymorphic: true, dependent: :destroy
  belongs_to :user

  validates :reason, presence: true

  validate :user_can_only_flag_once, on: :create

  alias_attribute :message, :reason

  def user_can_only_flag_once
    errors.add(:user_already_flagged, "user has already flagged this resource") if Flag.where(user_id: user_id, flaggable_id: flaggable_id).present?
  end
end
