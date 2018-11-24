# frozen_string_literal: true

class Types::UserType < Types::BaseActiveRecordObject
  field :id, ID, null: false
  field :full_name, String, null: false
  field :display_id, ID, null: false

end
