# frozen_string_literal: true

class Mutations::UpdateAcquiredCertification < Types::BaseMutationType
  null true
  description "will create a acquired certification for the current user"

  argument :acquired_certification_input, Types::AcquiredCertificationInputType, required: true

  field :acquired_certification, Types::AcquiredCertificationType, null: true

  def resolve(acquired_certification_input:)
    updated_params = acquired_certification_input.to_h

    cert = AcquiredCertification.find(acquired_certification_input[:id])
    cert.update(updated_params)

    {
        acquired_certification: cert
    }
  end
end