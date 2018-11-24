# frozen_string_literal: true

class Mutations::EditIncidentReport < Types::BaseMutationType
  null true

  description "original user or superuser can edit an incident report"

  argument :id, ID, required: true
  argument :report_id, ID, required: true
  argument :message, String, required: true

  field :incident, Types::IncidentType, null: false

  def resolve(id:, report_id:, message)
    incident = Incident.find(incident_input[:id])
    report = incident.incident_reports.find(:id)
    if report.save # add user points
      context[:current_user]&.add_points(5, category: 'incident report')
    end

    {
        incident: incident,
        errors: incident.errors
    }

  end
end
