# frozen_string_literal: true

module Mutations
  class DeleteAcquiredCertification < Types::BaseMutationType
    null true
    description "will delete the acquired certification for the current user"

    argument :id, ID, required: true

    field :success, Boolean, null: false

    def resolve(id:)
      cert = context[:current_user].acquired_certifications.find(id)

      context[:current_user]&.subtract_points(5, category: "added_certification") if cert.delete

      {
        success: cert.present?
      }
    end
  end
end
