module Types
  class MutationType < Types::BaseObject

    # Incidents
    field :incident_add_flag, Types::IncidentType, mutation: Mutations::IncidentAddFlag
    field :incident_confirm, Types::IncidentType, mutation: Mutations::IncidentConfirm
    field :incident_create, Types::IncidentType, mutation: Mutations::IncidentCreate
    field :incident_down_vote, Types::IncidentType, mutation: Mutations::IncidentDownvote
    field :incident_remove_vote, Types::IncidentType, mutation: Mutations::IncidentRemoveVote
    field :incident_up_vote, Types::IncidentType, mutation: Mutations::IncidentUpvote

  end
end