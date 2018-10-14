class Mutations::IncidentRemoveVote < Types::BaseMutationType

  null true
  description "to totally remove a vote."

  argument :incident_id, Int, required: true

  def resolve(incident_id:)
    incident = Incident.find(incident_id)
    incident.remove_vote(user: context[:current_user])
    incident
  end
end