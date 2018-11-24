# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Incidents
    field :incident_add_flag, mutation: Mutations::IncidentAddFlag
    field :incident_confirm, mutation: Mutations::IncidentConfirm
    field :incident_create, mutation: Mutations::IncidentCreate
    field :incident_down_vote, mutation: Mutations::IncidentDownvote
    field :incident_remove_vote, mutation: Mutations::IncidentRemoveVote
    field :incident_up_vote, mutation: Mutations::IncidentUpvote

    field :create_incident_report, mutation: Mutations::CreateIncidentReport
    field :update_incident_report, mutation: Mutations::UpdateIncidentReport
  end
end
