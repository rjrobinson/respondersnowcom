# frozen_string_literal: true

class Mutations::IncidentDownvote < Types::BaseMutationType
  null true
  description "will allow users to DOWNVOTE an incident"

  argument :id, ID, required: true
  field :incident, Types::IncidentType, null: false

  def resolve(id:)
    incident = Incident.find(id)
    incident.downvote(user: context[:current_user])

    {
        incident: incident,
        errors: incident&.errors
    }
  end
end
