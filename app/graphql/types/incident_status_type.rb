# frozen_string_literal: true

class Types::IncidentStatusType < Types::ActiveRecordBase
  description "A status"

  field :id, ID, null: false
  field :name, String, null: false
  field :abvr, String, null: true
end
