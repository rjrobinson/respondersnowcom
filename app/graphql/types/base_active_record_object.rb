# frozen_string_literal: true

module Types
  class BaseActiveRecordObject < Types::BaseActiveRecordObject
    field :errors, [Types::ActiveRecordErrorType], null: true

    def errors
      object.errors.each { |e| { field_name: e, error: object.errors[e] } }
    end
  end
end
