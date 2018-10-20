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
    true
  end

  def self.authorized?(object, context)
    authorized ||= true
  end

end