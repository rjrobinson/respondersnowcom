# frozen_string_literal: true

class Mutations::IncidentAddFlag < Types::BaseMutationType
  null true
  description "qualified users can flag a post. or should anyone? "

  argument :incident, Types::IncidentInputType, required: true

  def resolve(incident:)
    incident = Incident.find(incident[:id])
    flag = incident&.flags&.new(reason: incident[:message], user: context[:current_user])
    if flag&.save # add user points
      context[:current_user]&.add_points(20, category: 'flagged incident')
    end

    incident
  end
end
