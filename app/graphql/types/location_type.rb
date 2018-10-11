class Types::LocationType < Types::BaseObject

  field :id, ID, null: false

  field :latitude, Float, null: false
  field :longitude, Float, null: false

  field :address, String, null: false
  field :state, String, null: false
  field :county, String, null: false
  field :city, String, null: false
  field :box, String, null: true
  field :zipcode, String, null: true

  field :created_at, String, null: false
  field :updated_at, String, null: false
end

