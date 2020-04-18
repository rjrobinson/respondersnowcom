# frozen_string_literal: true

class Types::AcquiredCertificationInputType < Types::BaseInputType
  graphql_name "AcquiredCertificationInputType"

  description "Acquired Certification Input Type. To create or edit one"

  argument :id, ID, required: false
  argument :acquired_on, String, required: false
  argument :certification_id, ID, required: true
  argument :ceus, Integer, required: false
  argument :expires, Boolean, required: false
  argument :expires_on, String, required: false
  argument :number, ID, required: false
  argument :state, String, required: false
  argument :user_id, ID, required: false do
    description "Not needed unless being added by an admin user. mutation should default to current user."
  end
end
