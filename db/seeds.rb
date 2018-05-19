# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'csv'
#
# CSV.foreach('data/nj_agencies.csv', headers: true, header_converters: :symbol) do |row|
#   a = Agency.find_or_create_by(name: row[:name])
#   a.level = row[:type] if row[:type]
#   city_state = "#{row[:city]}, #{row[:state]}"
#   p city_state
#   location = Location.find_or_create_by(address: city_state)
#   p location
#   location.save
#
#   a.update(location_id: location.id)
#   a.save
# end
