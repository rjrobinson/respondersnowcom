class Mutations::IncidentConfirm < Types::BaseMutationType

  null true
  description "will allow users to CONFIRM an incident"

  argument :incident, Types::IncidentInputType, required: true

  def resolve(incident:)
    incident = Incident.find(incident[:id])
    incident.confirm(user: context[:current_user])
    incident
  end


  def self.accessible?(context)
    context[:current_user]&.can_confirm?
  end


end