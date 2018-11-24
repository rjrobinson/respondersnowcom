# frozen_string_literal: true

class Types::ActiveRecordErrorType < Types::BaseActiveRecordObject
  description "An ActiveRecord Error"

  field :field_name, String, null: false

  field :error, [String], null: false
end
