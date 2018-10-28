# frozen_string_literal: true

class Mutations::IncidentAddFlag < Types::BaseMutationType
  null true
  description "Super Users"

  argument :incident, Types::IncidentInputType, required: true

  def resolve(incident:)
    incident = Incident.find(incident[:id])
    incident.flags.create(reason: incident[:message], user: context[:current_user])
    incident
  end
end
