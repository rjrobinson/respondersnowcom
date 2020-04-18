# frozen_string_literal: true
module Types
  class AcquiredCertificationType < Types::BaseObject
    implements Types::NodeType
    # description "Users certifications"

    field :acquired_on, GraphQL::Types::ISO8601DateTime, null: true, description: "Timestamp of date acquired"
    field :certification, Types::CertificationType, null: false
    field :ceus, Integer, null: true
    field :expires, Boolean, null: false
    field :expires_on, GraphQL::Types::ISO8601DateTime, null: false, description: "Timestamp of expiration"
    field :number, String, null: true
    field :state, String, null: false
  end
end
