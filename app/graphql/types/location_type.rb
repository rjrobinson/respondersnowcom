class Types::LocationType < Types::BaseObject

  field :id, ID, null: false

  field :latitude, Float, null: true
  field :longitude, Float, null: true

  # field :address, String, null: false
  field :street, String, null: true
  field :state, String, null: false
  field :county, String, null: true
  field :city, String, null: false
  field :box, String, null: true
  field :zipcode, String, null: true
  
end

