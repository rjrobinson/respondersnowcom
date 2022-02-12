# frozen_string_literal: true

module Types
  class IncidentStatusType < Types::ActiveRecordBase
    description "A status"

    field :id, ID, null: false
    field :name, String, null: false
    field :abvr, String, null: true
  end
end
