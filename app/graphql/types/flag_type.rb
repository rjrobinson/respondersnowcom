# frozen_string_literal: true

class Types::FlagType < Types::BaseActiveRecordObject
  field :id, ID, null: false
  field :message, String, null: false

  def message
    object.reason
  end

  field :user, Types::UserType, null: false

end
