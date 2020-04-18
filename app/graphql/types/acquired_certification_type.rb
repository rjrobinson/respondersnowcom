# frozen_string_literal: true
module Types
  class AcquiredCertificationType < Types::BaseObject
    implements Types::NodeType
    # description "Users certifications"

    field :acquired_on, String, null: true
    field :certification, Types::CertificationType, null: false
    field :ceus, Integer, null: true
    field :expires, Boolean, null: false
    field :expires_on, String, null: true
    field :number, String, null: true
    field :state, String, null: false

  end
end
