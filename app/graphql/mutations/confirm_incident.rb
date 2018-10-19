class Mutations::ConfirmIncident < Types::BaseMutationType

  null false
  description "add description"

  argument :incident_id, Integer, required: true
  #  ADD RESOLVE METHOD
  def resolve(incident:)
  #   Logic to confirm incident.
  end
end
