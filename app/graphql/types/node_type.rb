# frozen_string_literal: true

module Types
  module NodeType
    include Types::BaseInterface
    description "Common implementation for persisted types"

    field :id, ID, null: false, description: "Unique identifier for record"
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: "Timestamp of most recent update"
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: "Timestamp of initial creation"

    field :errors, [Types::ActiveRecordErrorType], null: true

    def errors
      object.errors.map { |e| { field_name: e, errors: object.errors[e] } }
    end
  end
end
