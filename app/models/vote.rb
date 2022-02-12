# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :vote_value, presence: true

  validate :user_only_has_one_vote, on: :create
  # validates :user, uniqueness: {scope: :voteable}

  def user_only_has_one_vote
    errors.add(:user_already_has_vote, "This user has already voted.") if Vote.where(user_id: user_id, voteable_id: voteable_id).present?
  end

  def upvote
    update(vote_value: 1)
  end

  def downvote
    update(vote_value: -1)
  end

  def remove
    update(vote_value: 0)
  end
end
