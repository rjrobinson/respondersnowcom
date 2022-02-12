# frozen_string_literal: true

module Types
  class IncidentGroupType < Types::ActiveRecordBase
    field :id, ID, null: false
    field :name, String, null: false
  end
end
