# frozen_string_literal: true

class Mutations::FlagReport < Types::BaseMutationType
  null true
  description "qualified users can flag a report"

  argument :id, ID, required: true
  argument :reason, String, required: true

  field :incident, Types::IncidentType, null: false

  def resolve(id:, reason:)
    report = IncidentReport.find(id)
    flag = report&.flags&.new(reason: reason, user: context[:current_user])

    if flag&.save # add user points
      context[:current_user]&.add_points(5, category: 'flagged incident')
    end

    {
      incident: report.incident,
      errors: report&.errors,
    }
  end
end
