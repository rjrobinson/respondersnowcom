class Flag < ApplicationRecord

  INCIDENT_FLAG_TYPES = "Inappropriate"

  belongs_to :flaggable, polymorphic: true
  belongs_to :user


  validates_presence_of :reason

  validate :user_can_only_flag_once, on: :create

  def user_can_only_confirm_once
    if Flag.where(user_id: user_id, flaggable_id: flaggable_id).present?
      errors.add(:user_already_flagged, "user has already flagged this resource")
    end
  end

end
