class Mutations::IncidentConfirm < Types::BaseMutationType

  null true
  description "will allow users to CONFIRM an incident"

  argument :incident_id, ID, required: true

  def resolve(incident_id:)
    incident = Incident.find(incident_id)
    incident.confirm(user: context[:current_user])
    incident
  end


  def self.accessible?(context)
    context[:current_user]&.can_confirm?
  end


end