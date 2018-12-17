# frozen_string_literal: true

class Incident < ApplicationRecord
  belongs_to :location
  belongs_to :incident_group
  belongs_to :incident_status

  belongs_to :user
  belongs_to :county

  has_many :votes, as: :voteable, dependent: :destroy
  has_many :confirmations, as: :confirmable, dependent: :destroy

  has_many :flags, as: :flaggable, dependent: :destroy

  has_many :incident_reports, dependent: :destroy


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
    # {:city=>"North Brunswick Township",
    #  :county=>"Middlesex County",
    #  :formatted_address=>"880 Ridgewood Ave, North Brunswick Township, NJ 08902, USA",
    #  :incident_group_id=>"e608e12a-c181-4b65-a1c0-a6a0ff63bbe5",
    #  :incident_status_id=>"598879c9-4d1f-4e90-b128-47ae5092ba98",
    #  :lat=>40.4642341,
    #  :lng=>-74.47009539999999,
    #  :message=>"Squad Call",
    #  :state=>"NJ",
    #  :street=>"Ridgewood Ave"
    # :street_number => "980"}

    # Find or create the location #
    location = Location.find_or_create_by(
        street: "#{params[:street_number] || ""} #{params[:street]}",
        state: params[:state],
        city: params[:city],
        county: params[:county],
        state: params[:state],
        latitude: params[:lat],
        longitude: params[:lng])

    county = County.find_or_create_by(name: params[:county], state: params[:state])

    incident = if location.save
                 Incident.create(
                     location: location,
                     message: params[:message],
                     incident_group_id: params[:incident_group_id],
                     user: params[:current_user],
                     incident_status_id: params[:incident_status_id] || IncidentStatus.find_or_create_by(name: "unconfirmed")
                 )

               end


    incident
  end
end
