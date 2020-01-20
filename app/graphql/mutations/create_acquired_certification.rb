# frozen_string_literal: true

class Mutations::CreateAcquiredCertification < Types::BaseMutationType
  null true
  description "will create a acquired certification for the current user"

  argument :acquired_certification_input, Types::AcquiredCertificationInputType, required: true

  field :acquired_certification, Types::AcquiredCertificationType, null: true

  def resolve(acquired_certification_input:)
    cert = AcquiredCertification.new(acquired_certification_input.to_h.merge(user: context[:current_user]))

    if cert.save
      context[:current_user]&.add_points(5, category: "added_certification")
    end

    {
        acquired_certification: cert
    }
  end
end
