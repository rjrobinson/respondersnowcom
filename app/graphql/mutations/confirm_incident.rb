# frozen_string_literal: true

class Mutations::ConfirmIncident < Types::BaseMutationType
  null true
  description "will allow users to CONFIRM an incident"

  argument :id, ID, required: true

  field :incident, Types::IncidentType, null: false

  def resolve(id:)
    incident = Incident.find(id)
    incident.confirm(user: context[:current_user])

    if incident.errors.nil? # add points
      context[:current_user]&.add_points(2, category: "Voted")
    end

    {
      incident: incident,
    }
  end

  def self.accessible?(context)
    context[:current_user]&.can_confirm?
  end
end
