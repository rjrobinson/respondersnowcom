class Vote < ApplicationRecord

  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates_presence_of :vote_value

  validate :user_only_has_one_vote, on: :create
  # validates :user, uniqueness: {scope: :voteable}


  def user_only_has_one_vote
    if Vote.where(user_id: user_id, voteable_id: voteable_id).present?
      errors.add(:user_already_has_vote, "This user has already voted.")
    end
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