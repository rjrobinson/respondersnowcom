class Types::MutationType < Types::BaseObject

  field :create_incident, Types::IncidentType, mutation: Mutations::CreateIncident

end
