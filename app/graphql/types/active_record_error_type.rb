# frozen_string_literal: true

class Types::ActiveRecordErrorType < Types::BaseObject

  description "Returns An ActiveRecord Error"

  field :field_name, String, null: true
  field :errors, [String], null: true

end
