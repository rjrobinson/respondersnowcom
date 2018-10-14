class Mutations::CreateIncident < Types::BaseMutationType

  null true
  description "address should be one line including at least street, city, state "

  argument :incident, Types::IncidentInputType, required: true


  def resolve(incident:)
    location = Location.find_or_create_by(address: incident.address)
    i = if location.save
          scene_lookup = IncidentType.find_or_create_by(name: incident.scene_type)
          Incident.new(message: incident.message,
                       location: location,
                       incident_type: scene_lookup,
                       user: context[:current_user],
                       status: incident.status || "Unconfirmed"
          )

        end

    i.save if i.valid?

    i
  end
end