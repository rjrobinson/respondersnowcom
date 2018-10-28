# frozen_string_literal: true

class Mutations::IncidentDownvote < Types::BaseMutationType
  null true
  description "will allow users to DOWNVOTE an incident"

  argument :incident, Types::IncidentInputType, required: true

  def resolve(incident:)
    incident = Incident.find(incident[:id])
    incident.downvote(user: context[:current_user])
    incident
  end
end
