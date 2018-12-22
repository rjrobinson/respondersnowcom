# frozen_string_literal: true

class Types::IncidentGroupType < Types::ActiveRecordBase
  field :id, ID, null: false
  field :name, String, null: false
end
