# frozen_string_literal: true

class Types::ActiveRecordErrorType < Types::BaseObject
  description "An ActiveRecord Error"

  field :field_name, String, null: false

  field :error, [String], null: false
end
