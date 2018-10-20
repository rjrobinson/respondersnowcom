class Mutations::ConfirmIncident < Types::BaseMutationType

  null false
  description "allows those that have access the ability to confirm"

  argument :incident_id, Integer, required: true
  #  ADD RESOLVE METHOD
  def resolve(incident:)
    incident = Incident.find(incident_id)
    incident.confrim(user: context[:current_user])

    incident
  end
end
