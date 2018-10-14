# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('data/cities.csv', headers: true, header_converters: :symbol) do |row|

  city_state = "#{row[:city]}, NJ"

  location = Location.find_or_create_by(address: city_state)

  location.state = "NJ"
  location.county = row[:county]
  location.city = row[:city]

  location.zipcode = "#{row[:city]}, #{row[:state]}".to_zip.first
  location.save
  # a.update(location_id: location.id)
  # a.save
end
