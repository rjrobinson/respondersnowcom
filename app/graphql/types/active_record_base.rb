# frozen_string_literal: true

module Types
  class ActiveRecordBase < GraphQL::Schema::Object


    field :created_at, String, null: false
    field :updated_at, String, null: false
    field :errors, [Types::ActiveRecordErrorType], null: true

    def errors
      object.errors.map { |e| { field_name: e, errors: object.errors[e] } }
    end
  end
end
