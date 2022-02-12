# frozen_string_literal: true

module Types
  class HospitalType < Types::ActiveRecordBase
    field :id, ID, null: false
    field :name, String, null: false

    field :location, Types::LocationType, null: true
    field :abilities, String, null: true

    field :county, String, null: true

    field :status, Types::HospitalStatusType, null: true
  end
end
