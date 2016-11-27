# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Agency.create! name: 'North Brunswick First Aid & Rescue Squad', email: 'nbfars@nbfars.org', password: '1234password', confirmed_at: 1.day.ago

Responder.create! first_name: 'Tony', last_name: 'Stark', email: 'ironman@avengers.org', password: 'password', confirmed_at: 1.day.ago