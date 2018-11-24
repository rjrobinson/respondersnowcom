# frozen_string_literal: true

class Types::ConfirmationType < Types::ActiveRecordBase
  field :id, ID, null: false
  field :user, Types::UserType, null: false
end
