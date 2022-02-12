# frozen_string_literal: true

module Mutations
  class CreateCertification < Types::BaseMutationType
    null true
    description "will create a acquired certification for the current user"

    argument :certification_input, Types::CertificationInputType, required: true

    field :certification, Types::CertificationType, null: true

    def resolve(certification_input:)
      cert = Certification.new(certification_input.to_h.merge(creator: context[:current_user]))

      context[:current_user]&.add_points(5, category: "added_certification") if cert.save

      {
        certification: cert
      }
    end
  end
end
