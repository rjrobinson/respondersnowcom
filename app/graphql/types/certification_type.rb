# frozen_string_literal: true

module Types
  class CertificationType < Types::ActiveRecordBase
    implements Types::NodeType

    field :abvr, String, null: false
    field :active, Boolean, null: false
    field :course_code, String, null: false
    field :name, String, null: false
  end
end
