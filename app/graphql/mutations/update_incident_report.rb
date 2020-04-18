# frozen_string_literal: true

class Mutations::UpdateIncidentReport < Types::BaseMutationType
  null true

  description "original user or superuser can update an incident report"

  argument :report_input, Types::ReportInputType, required: true

  field :incident, Types::IncidentType, null: false

  def resolve(report_input:)
    incident = Incident.find(report_input[:incident_id])
    report = incident.incident_reports.find(report_input[:report_id])
    report.update(message: report_input[:message], user: context[:current_user])

    {
      incident: incident,
      errors: incident.errors,
    }
  end
end
