# frozen_string_literal: true

class Mutations::IncidentCreate < Types::BaseMutationType
  null true
  description "address should be one line including at least street, city, state "

  argument :incident, Types::IncidentInputType, required: true

  field :incident, Types::IncidentType, null: true

  def resolve(incident:)
    incident = Incident.new_with_location(incident.to_h.merge(current_user: context[:current_user]))
    if incident.save
      context[:current_user]&.add_points(1, category: "created incident")
    end

    {
        incident: incident,
        errors: []
    }
  end
end
