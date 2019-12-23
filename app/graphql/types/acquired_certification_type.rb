# frozen_string_literal: true

class Types::AcquiredCertificationType < Types::ActiveRecordBase
  #description "Users certifications"

  field :id, ID, null: false

  field :acquired_on, String, null: true
  field :certification, Types::CertificationType, null: false
  field :ceus, Integer, null: true
  field :expires, Boolean, null: false
  field :expires_on, String, null: true
  field :number, String, null: true
  field :state, String, null: false

end

