# frozen_string_literal: true

class Types::UserType < Types::ActiveRecordBase
  field :id, ID, null: false
  field :full_name, String, null: false
  field :display_id, ID, null: false
end
