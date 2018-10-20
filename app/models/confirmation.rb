class Confirmation < ApplicationRecord

  belongs_to :confirmable, polymorphic: true
  belongs_to :user

  validate :user_can_only_confirm_once, on: :create
  # validates :user, uniqueness: {scope: :voteable}


  def user_can_only_confirm_once
    if Confirmation.where(user_id: user_id, confirmable_id: confirmable_id).present?
      errors.add(:user_already_confirmed, "This user has already confirmed")
    end
  end
end
