class Incident < ApplicationRecord

  belongs_to :location
  belongs_to :incident_type
  belongs_to :user

  has_many :votes, as: :voteable
  has_many :confirmations, as: :confirmable

  # has_many :incident_confirmeds
  # alias_attribute :confirmations, :incident_confirmeds
  has_many :flags, as: :flagable

  has_many :incident_reports


  TRENDING_VOTES_COUNT = 100
  SYSTEM_EPOCH = 1.day.ago.to_i
  SECOND_DIVISOR = 3600


  def self.trending
    sorted = Incident.last(100).each.map do |inc|
      pop = inc.popularity
      rec = inc.recentness
      [pop + rec, inc.id]
    end.sort_by(&:first)

    sorted
  end


  def calculate_rank
    update(rank: popularity + recentness, ranked_at: Time.now)
  end

  def current_rank
    popularity + recentness
  end

  def popularity(weight: 3)
    (votes.count + incident_reports.count) * weight
  end

  def recentness(timestamp: created_at, epoch: SYSTEM_EPOCH, divisor: SECOND_DIVISOR)
    seconds = timestamp.to_i - epoch

    (seconds / divisor).to_i
  end


  def self.trending
    sorted = Incident.last(100).each.map do |inc|
      pop = inc.popularity
      puts pop
      rec = inc.recentness
      puts rec
      [pop + rec, inc.id]
    end.sort_by(&:first)

    sorted
  end


  def is_trending
    votes.count > TRENDING_VOTES_COUNT
  end

  # VOTING
  def upvote(user:)
    votes.find_or_create_by(user: user).update(vote_value: 1)
  end

  def downvote(user:)
    votes.find_or_create_by(user: user).update(vote_value: -1)
  end

  def remove_vote(user:)
    votes.find_or_create_by(user: user).delete
  end

  def upvotes
    votes.where(vote_value: 1).count
  end

  def downvotes
    votes.where(vote_value: -1).count
  end

  def score
    upvotes - downvotes
  end

  # Confirmations
  def confirm(user:)
    confirmations.find_or_create_by(user: user)
  end

  # : User.first
  def self.new_with_location(params)

    # Find or create the location #
    location = if params[:latitude].present? && params[:longitude].present?
                 Location.new_by_coord(lat: params[:latitude], long: params[:longitude])
               else
                 Location.find_or_create_by(street: params[:street], state: params[:state], city: params[:city])
               end

    location.valid?

    i = if location.save
          Incident.new(message: params[:message],
                       location: location,
                       incident_type: IncidentType.find_or_create_by(name: params[:scene_type].downcase),
                       user: params[:current_user],
                       status: params[:status] || "Unconfirmed"
          )

        end

    i.save if i.valid?

    i
  end


end
