# frozen_string_literal: true

module Types
  class BaseMutationType < GraphQL::Schema::Mutation
    field :errors, [Types::ActiveRecordErrorType], null: true
  end
end
