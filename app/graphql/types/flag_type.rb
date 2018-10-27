# frozen_string_literal: true

class Types::FlagType < Types::BaseObject
  field :id, ID, null: false
  field :message, String, null: false

  def message
    object.reason
  end

  field :user, Types::UserType, null: false

  field :errors, [Types::ActiveRecordErrorType], null: true

  def errors
    object.errors.map {|e| {field_name: e, error: object.errors[e]}}
  end


end
