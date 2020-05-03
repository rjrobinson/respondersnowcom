# frozen_string_literal: true
module Mutations
  class DeleteAcquiredCertification < Types::BaseMutationType
    null true
    description "will delete the acquired certification for the current user"

    argument :id, ID, required: true

    field :success, Boolean, null: false

    def resolve(id:)
      cert = context[:current_user].acquired_certifications.find(id)

      if cert.delete
        context[:current_user]&.subtract_points(5, category: "added_certification")
      end

      {
        success: cert.present?,
      }
    end
  end
end
