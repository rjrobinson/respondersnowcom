module Types

  class BaseObject < GraphQL::Schema::Object

    field :errors, [Types::ActiveRecordErrorType], null: true

    def errors
      object.errors.each {|e| {field_name: e, error: object.errors[e]}}
    end


    field :created_at, String, null: false
    field :updated_at, String, null: false
  end

end