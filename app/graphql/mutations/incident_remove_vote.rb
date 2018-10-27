class Mutations::IncidentRemoveVote < Types::BaseMutationType

  null true
  description "to totally remove a vote."

  argument :incident, Types::IncidentInputType, required: true

  def resolve(incident:)
    incident = Incident.find(incident[:id])
    incident.remove_vote(user: context[:current_user])
    incident
  end
end