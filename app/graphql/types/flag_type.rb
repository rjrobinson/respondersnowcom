# frozen_string_literal: true
module Types
  class FlagType < Types::ActiveRecordBase
    implements Types::NodeType

    field :message, String, null: false
    field :reason, String, null: false
    field :user, Types::UserType, null: false
  end
end
