# frozen_string_literal: true

class Types::IncidentSceneType < Types::BaseObject
  field :name, String, null: false

  field :errors, [Types::ActiveRecordErrorType], null: true

  # def errors
  #   object.errors.each {|e| {field_name: e, error: object.errors[e]}}
  # end
end
