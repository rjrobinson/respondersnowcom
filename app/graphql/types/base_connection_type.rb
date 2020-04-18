# frozen_string_literal: true

module Types
  class BaseConnectionType < GraphQL::Types::Relay::BaseConnection
    field :page_count, Integer, null: true
    field :total_count, Integer, null: true
  end
end
