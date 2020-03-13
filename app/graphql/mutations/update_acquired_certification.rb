# frozen_string_literal: true

class Mutations::UpdateAcquiredCertification < Types::BaseMutationType
  null true
  description "will create a acquired certification for the current user"

  argument :acquired_certification_input, Types::AcquiredCertificationInputType, required: true

  field :acquired_certification, Types::AcquiredCertificationType, null: true

  def resolve(acquired_certification_input:)
    updated_params = acquired_certification_input.delete(:id)

    cert = AcquiredCertification.find(acquired_certification_input[:id]).update(updated_params.to_h)
    #NOTE this is not the same as a renewal.
    # need to build an edge case for that.
    #
    {
        acquired_certification: cert
    }
  end
end