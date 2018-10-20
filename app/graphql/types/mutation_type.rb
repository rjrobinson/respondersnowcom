class Types::MutationType < Types::BaseObject

  # Incidents
  field :create_incident, Types::IncidentType, mutation: Mutations::CreateIncident
  field :up_vote_incident, Types::IncidentType, mutation: Mutations::IncidentUpvote
  field :down_vote_incident, Types::IncidentType, mutation: Mutations::IncidentDownvote
  field :remove_vote_incident, Types::IncidentType, mutation: Mutations::IncidentRemoveVote
  field :confirm_incident, Types::IncidentType, mutation: Mutations::IncidentConfirm

end
