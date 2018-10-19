module Types
  class BaseObject < GraphQL::Schema::Object

    field :errors, [Types::ErrorType], null: true

    def errors
      object.errors.each {|e| {field_name: e, error: object.errors[e]}}
    end
    

  end
end
