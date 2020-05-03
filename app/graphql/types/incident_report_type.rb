# frozen_string_literal: true
module Types
  class IncidentReportType < Types::ActiveRecordBase
    description "A list of reports, who updated them, and when."

    field :id, ID, null: false
    field :message, String, null: false

    field :flags, Types::FlagType, null: true
    field :user, Types::UserType, null: false
    field :created_at, String, null: false
  end
end
