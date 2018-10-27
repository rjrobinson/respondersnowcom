# frozen_string_literal: true

class Types::IncidentReport < Types::BaseObject
  description "A list of reports, who updated them, and when."

  field :message, String, null: false

  field :user, Types::UserType, null: false
end
