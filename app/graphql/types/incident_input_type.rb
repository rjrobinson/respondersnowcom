class Types::IncidentInputType < GraphQL::Schema::InputObject

  argument :incident_id, ID, required: false
end