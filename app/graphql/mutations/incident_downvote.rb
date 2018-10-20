class Mutations::IncidentDownvote < Types::BaseMutationType

  null true
  description "will allow users to DOWNVOTE an incident"

  argument :incident_id, ID, required: true

  def resolve(incident_id:)
    incident = Incident.find(incident_id)
    incident.downvote(user: context[:current_user])
    incident
  end
end