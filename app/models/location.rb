class Location < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: ->(obj) {obj.address.present? && obj.address_changed?}


end


# create_table "locations", id: :serial, force: :cascade do |t|
# #   t.string "address"
# #   t.float "latitude"
# #   t.float "longitude"
# #   t.datetime "created_at", null: false
# #   t.datetime "updated_at", null: false
# # end