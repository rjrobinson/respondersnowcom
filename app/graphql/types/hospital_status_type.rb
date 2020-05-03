# frozen_string_literal: true
module Types
  class HospitalStatusType < Types::ActiveRecordBase
    field :id, ID, null: false
    field :county, String, null: false
    field :status, String, null: false
    field :reason, String, null: false
    field :start_time, String, null: false
    field :expire_time, String, null: false
  end
end
