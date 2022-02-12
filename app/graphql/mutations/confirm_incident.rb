# frozen_string_literal: true

module Mutations
  class ConfirmIncident < Types::BaseMutationType
    null true
    description "will allow users to CONFIRM an incident"

    argument :id, ID, required: true

    field :incident, Types::IncidentType, null: false

    def resolve(id:)
      incident = Incident.find(id)
      incident.confirm(user: context[:current_user])

      context[:current_user]&.add_points(2, category: "Voted") if incident.errors.nil? # add points

      {
        incident: incident
      }
    end

    def self.accessible?(context)
      context[:current_user]&.can_confirm?
    end
  end
end
