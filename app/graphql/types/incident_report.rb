# frozen_string_literal: true

class Types::IncidentReport < Types::ActiveRecordBase
  description "A list of reports, who updated them, and when."

  field :id, ID, null: false
  field :message, String, null: false

  field :flags, Types::FlagType, null: true
  field :user, Types::UserType, null: false
end
