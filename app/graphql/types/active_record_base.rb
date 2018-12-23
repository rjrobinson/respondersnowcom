# frozen_string_literal: true

module Types
  class ActiveRecordBase < GraphQL::Schema::Object
    field :errors, [Types::ActiveRecordErrorType], null: true

    def errors
      object.errors.map {|e| {field_name: e, errors: object.errors[e]}}
    end
  end
end
