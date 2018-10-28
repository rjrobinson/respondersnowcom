# frozen_string_literal: true

class Mutations::IncidentUpvote < Types::BaseMutationType
  null true
  description "will allow users to UPVOTE an incident"

  argument :incident, Types::IncidentInputType, required: true

  def resolve(incident:)
    incident = Incident.find(incident[:id])
    incident.upvote(user: context[:current_user])
    incident
  end
end
