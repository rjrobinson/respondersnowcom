class Vote < ApplicationRecord

  belongs_to :incident
  belongs_to :user

  validates_presence_of :vote_value

  validates :incident, uniqueness: {scope: :user}
  validates :user, uniqueness: {scope: :incident}


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
