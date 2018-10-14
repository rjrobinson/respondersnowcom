class Types::MutationType < Types::BaseObject

  field :create_incident, Types::IncidentType, mutation: Mutations::CreateIncident

  field :up_vote, Types::IncidentType, mutation: Mutations::IncidentUpvote
  field :down_vote, Types::IncidentType, mutation: Mutations::IncidentDownvote
  field :remove_vote, Types::IncidentType, mutation: Mutations::IncidentRemoveVote

end
