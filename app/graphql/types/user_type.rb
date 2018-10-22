class Types::UserType < Types::BaseObject

  field :id, ID, null: false
  field :full_name, String, null: false
  field :display_id, ID, null: false

  field :errors, [Types::ErrorType], null: true


end