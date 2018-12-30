# frozen_string_literal: true

class Incident < ApplicationRecord
  belongs_to :location
  belongs_to :incident_group
  belongs_to :incident_status
  belongs_to :user
  belongs_to :county

  has_many :incident_reports,  dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy
  has_many :confirmations, as: :confirmable, dependent: :destroy
  has_many :flags, as: :flaggable, dependent: :destroy


  TRENDING_VOTES_COUNT = 100
  SYSTEM_EPOCH = 1.day.ago.to_i
  SECOND_DIVISOR = 3600


  def status
    incident_status
  end

  scope :filter_flagged, -> {where(flagged: false)}

  def self.trending
    sorted = Incident.last(100).each.map do |inc|
      pop = inc.popularity
      rec = inc.recentness
      [pop + rec, inc.id]
    end.sort_by(&:first)

    sorted
  end

  def or_one_minute(some_date:)
    some_date ? some_date : 1.minute.ago
  end

  def resolve_stale(user: service_bot)
    status = IncidentStatus.find_or_create_by(name: "clear", abvr: "cl")

    if or_one_minute(some_date: incident_reports&.order(:updated_at)&.last&.updated_at) < 30.minutes.ago || incident_reports.count == 0
      incident_reports.new(message: "AUTOMATED MESSAGE >> \nThis incident has been marked inactive", user: user)
      update(incident_status: status)
    end

  end

  def self.calculate_rank(min_rank: 1.0)
    where("rank > ?", min_rank).each(&:calculate_rank)
  end

  def calculate_rank
    update(rank: popularity + recentness, ranked_at: Time.now)
  end

  def current_rank
    popularity + recentness
  end

  def popularity(weight: 3)
    (votes.count + incident_reports.count) ^ weight
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
    if confirmations.find_by(user: user)
      errors.add(:user_already_confirmed, "This user has already confirmed")
    else
      confirmations.find_or_create_by(user: user)
    end
  end


  def self.new_with_location(params)
    location = Location.find_or_create_by(
        street: "#{params[:street_number] || ""} #{params[:street]}",
        city: params[:city],
        county: params[:county],
        state: params[:state],
        latitude: params[:lat],
        longitude: params[:lng])

    county = County.find_or_create_by(name: params[:county], state: params[:state])

    location.update(county: county.name)

    incident = if location.save
                 Incident.create(
                     location: location,
                     message: params[:message],
                     incident_group_id: params[:incident_group_id],
                     user: params[:current_user],
                     incident_status_id: IncidentStatus.find_or_create_by(name: "unconfirmed").id,
                     county: county
                 )

               end


    incident
  end

end
