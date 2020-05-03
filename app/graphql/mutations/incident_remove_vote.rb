# frozen_string_literal: true
module Mutations
  class IncidentRemoveVote < Types::BaseMutationType
    null true
    description "to totally remove a vote."

    argument :id, ID, required: true
    field :incident, Types::IncidentType, null: false

    def resolve(id:)
      incident = Incident.find(id)
      incident.remove_vote(user: context[:current_user])

      {
        incident: incident,
        errors: incident&.errors,
      }
    end
  end
end
