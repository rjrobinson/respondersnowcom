# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Incidents
    field :flag_incident, mutation: Mutations::FlagIncident
    field :create_incident, mutation: Mutations::CreateIncident
    field :confirm_incident, mutation: Mutations::ConfirmIncident


    field :incident_down_vote, mutation: Mutations::IncidentDownvote
    field :incident_remove_vote, mutation: Mutations::IncidentRemoveVote
    field :incident_up_vote, mutation: Mutations::IncidentUpvote

    field :create_incident_report, mutation: Mutations::CreateIncidentReport
    field :update_incident_report, mutation: Mutations::UpdateIncidentReport

    field :create_acquired_certification, mutation: Mutations::CreateAcquiredCertification

  end
end
