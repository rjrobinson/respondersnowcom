# frozen_string_literal: true

class Mutations::CreateIncident < Types::BaseMutationType
  null true
  description "address should be one line including at least street, city, state "

  argument :incident_input, Types::IncidentInputType, required: true

  field :incident, Types::IncidentType, null: true

  def resolve(incident_input:)
    incident = Incident.new_with_location(incident_input.to_h.merge(current_user: context[:current_user]))

    if incident.save
      context[:current_user]&.add_points(5, category: "created incident")
    end

    {
      incident: incident,
      errors: incident&.errors.map { |e| { field_name: e, errors: membership&.errors[e] } },
    }
  end
end
