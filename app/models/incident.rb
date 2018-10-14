class Incident < ApplicationRecord

  belongs_to :location
  belongs_to :incident_type
  belongs_to :user

  has_many :votes
  has_many :incident_confirmeds
  has_many :incident_flags

  has_many :incident_reports

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
