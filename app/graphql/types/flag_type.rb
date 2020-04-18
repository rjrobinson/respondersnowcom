# frozen_string_literal: true

class Types::FlagType < Types::ActiveRecordBase
  implements Types::NodeType

  field :message, String, null: false
  field :reason, String, null: false
  field :user, Types::UserType, null: false
end
