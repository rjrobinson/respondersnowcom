# frozen_string_literal: true

class Types::UserType < Types::BaseObject
  implements Types::NodeType

  field :id, ID, null: false
  field :full_name, String, null: false
  field :display_id, ID, null: false

  field :acquired_certifications, [Types::AcquiredCertificationType], null: true
end
