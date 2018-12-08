# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.


    field :incidents_by_subscription, [IncidentType], null: true do
      description %|A list of Incidents from the users subscriptions.
                                 Incidents will be sent back newest first, but have the option to sort by their ranking|
    end

    def incidents_by_subscription
      context[:current_user]&.incidents&.filter_flagged
    end

    field :locations, [LocationType], null: true,
          description: 'List of locations'


    field :incidents, [IncidentType], null: false do
      description "this will return all incidents that have not been flagged more than 3 times."
      # TODO: Consider changing this value of 3 to be in a settings model.
    end

    def incidents
      Incident.filter_flagged.limit(10)
    end

    field :trending, [IncidentType], null: false

    def trending
      Incident.filter_flagged
    end

    field :incident, IncidentType, null: false do
      description "returns one incident"
      argument :id, ID, required: true
    end

    def incident(id:)
      Incident.find(id)
    end

    def locations
      Location.limit(10)
    end

    field :hospitals, [HospitalType], null: false do
      argument :on_divert, Boolean, required: false
    end

    def hospitals(on_divert: false)
      if on_divert
        Hospital.on_divert
      else
        Hospital.all
      end
    end
  end
end
