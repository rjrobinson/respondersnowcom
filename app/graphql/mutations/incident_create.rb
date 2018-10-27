# frozen_string_literal: true

class Mutations::IncidentCreate < Types::BaseMutationType
  null true
  description "address should be one line including at least street, city, state "

  argument :incident, Types::IncidentInputType, required: true


  def resolve(incident:)
    Incident.new_with_location(incident.to_h.merge(current_user: context[:current_user]))
  end
end
