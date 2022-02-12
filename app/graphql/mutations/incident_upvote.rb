# frozen_string_literal: true

module Mutations
  class IncidentUpvote < Types::BaseMutationType
    null true
    description "will allow users to UPVOTE an incident"

    argument :id, ID, required: true

    field :incident, Types::IncidentType, null: false

    def resolve(id:)
      incident = Incident.find(id)
      incident.upvote(user: context[:current_user])
      {
        incident: incident,
        errors: incident&.errors
      }
    end
  end
end
