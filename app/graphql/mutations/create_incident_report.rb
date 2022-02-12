# frozen_string_literal: true

module Mutations
  class CreateIncidentReport < Types::BaseMutationType
    null true

    description "users can add a report on an incident"

    argument :report_input, Types::ReportInputType, required: true

    field :incident, Types::IncidentType, null: false

    def resolve(report_input:)
      incident = Incident.find(report_input[:incident_id])

      report = incident.incident_reports.new(message: report_input[:message], user: context[:current_user])

      context[:current_user]&.add_points(5, category: "incident report") if report.save # add user points

      {
        incident: incident,
        errors: incident&.errors
      }
    end
  end
end
