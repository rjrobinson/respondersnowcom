module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :locations, [LocationType], null: true,
          description: 'List of locations'


    field :incidents, [IncidentType], null: false

    def incidents
      Incident.all
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
