class Types::FlagType < Types::BaseObject


  field :id, ID, null: false
  field :message, String, null: false
  field :user, Types::UserType, null: false
end