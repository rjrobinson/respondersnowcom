class Types::ConfirmationType < Types::BaseObject

  field :id, ID, null: false
  field :user, Types::UserType, null: false


end