# frozen_string_literal: true
module Types
  class ConfirmationType < Types::ActiveRecordBase
    field :id, ID, null: false
    field :user, Types::UserType, null: false
  end
end
