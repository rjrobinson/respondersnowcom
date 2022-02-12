# frozen_string_literal: true

module Mutations
  class FlagIncident < Types::BaseMutationType
    null true
    description "qualified users can flag a post. or should anyone? "

    argument :id, ID, required: true
    argument :reason, String, required: true

    field :incident, Types::IncidentType, null: false

    def resolve(id:, reason:)
      incident = Incident.find(id)
      flag = incident&.flags&.new(reason: reason, user: context[:current_user])
      context[:current_user]&.add_points(5, category: "flagged incident") if flag&.save # add user points

      {
        incident: incident,
        errors: incident&.errors
      }
    end
  end
end
