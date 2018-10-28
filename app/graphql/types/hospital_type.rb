# frozen_string_literal: true

class Types::HospitalType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false

  field :location, Types::LocationType, null: true
  field :abilities, String, null: true

  field :county, String, null: true

  field :status, Types::HospitalStatusType, null: true

  field :errors, [Types::ActiveRecordErrorType], null: true

  def errors
    object.errors.each {|e| {field_name: e, error: object.errors[e]}}
  end


end
