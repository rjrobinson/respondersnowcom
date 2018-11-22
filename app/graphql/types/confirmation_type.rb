# frozen_string_literal: true

class Types::ConfirmationType < Types::BaseObject
  field :id, ID, null: false
  field :user, Types::UserType, null: false

  field :errors, [Types::ActiveRecordErrorType], null: true

  def errors
    object.errors.each { |e| { field_name: e, error: object.errors[e] } }
  end
end
