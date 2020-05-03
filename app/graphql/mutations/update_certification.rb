# frozen_string_literal: true
module Mutations
  class UpdateCertification < Types::BaseMutationType
    null true
    description "will update certification"

    argument :certification_input, Types::CertificationInputType, required: true

    field :certification, Types::CertificationType, null: true

    def resolve(certification_input:)
      cert = Certification.find(certification_input.to_h[:id])

      cert&.update(certification_input.to_h.except(:id))

      {
        certification: cert,
      }
    end
  end
end
