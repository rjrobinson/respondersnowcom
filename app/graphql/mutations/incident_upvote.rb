class Mutations::IncidentUpvote < Types::BaseMutationType

  null true
  description "will allow users to UPVOTE an incident"

  argument :incident_id, ID, required: true

  def resolve(incident_id:)
    incident = Incident.find(incident_id)
    incident.upvote(user: context[:current_user])
    incident
  end
end