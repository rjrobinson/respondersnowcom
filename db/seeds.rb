# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# require 'csv'
#
# unless Rails.env.test?
#   CSV.foreach('data/cities.csv', headers: true, header_converters: :symbol) do |row|


#     location = Location.find_or_create_by(city: row[:city], state: "NJ")

#     location.county = row[:county]
#     location.city = row[:city]

#     location.zipcode = "#{row[:city]}, #{row[:state]}".to_zip.first
#     puts "Saving #{location.city}"
#     location.save
#     # a.update(location_id: location.id)
#     # a.save
#   end


  hospitals = [
      {
          county: "Atlantic",
          facility: "ARMC SED - Kessler",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Atlantic",
          facility: "Atlanticare Regional Medical Center City Division",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Atlantic",
          facility: "Atlanticare Regional Medical Center Mainland Division",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Atlantic",
          facility: "Shore Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Bergen",
          facility: "Bergen Regional Medical Center L.P.",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Bergen",
          facility: "Englewood Hospital And Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Bergen",
          facility: "HACKENSACK MERIDIAN HEALTH PASACACK VALLEY MEDICAL",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Bergen",
          facility: "Hackensack University Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Bergen",
          facility: "Holy Name Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Bergen",
          facility: "Valley Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Burlington",
          facility: "Lourdes Medical Center Of Burlington County",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Burlington",
          facility: "Lourdes-Deborah SED",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Burlington",
          facility: "Virtua Memorial Hospital Of Burlington County",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Burlington",
          facility: "Virtua West Jersey Hospital - Marlton",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Camden",
          facility: "Cooper Hospital/University Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Camden",
          facility: "Kennedy Memorial Hospitals UMC Cherry Hill",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Camden",
          facility: "Kennedy Memorial Hospitals UMC Stratford",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Camden",
          facility: "Our Lady Of Lourdes Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Camden",
          facility: "Virtua West Jersey Hospital - Voorhees",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Camden",
          facility: "Virtua-Berlin SED",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Camden",
          facility: "Virtua-Camden SED",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Cape May",
          facility: "Cape Regional Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Cumberland",
          facility: "Inspira Medical Center Vineland",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Cumberland",
          facility: "Inspira-Bridgeton SED",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Essex",
          facility: "Clara Maass Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Essex",
          facility: "East Orange General Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Essex",
          facility: "Hackensack UMC Mountainside",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Essex",
          facility: "Newark Beth Israel Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Essex",
          facility: "Saint Barnabas Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Essex",
          facility: "Saint Michael's Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Essex",
          facility: "University Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Essex",
          facility: "VA New Jersey Health Care System (East Orange)",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Gloucester",
          facility: "Inspira Medical Center Woodbury",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Gloucester",
          facility: "Kennedy Memorial Hospitals UMC Washington Township",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Hudson",
          facility: "Bayonne Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Hudson",
          facility: "Christ Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Hudson",
          facility: "Hoboken University Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Hudson",
          facility: "Hudson Regional Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Hudson",
          facility: "Jersey City Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Hudson",
          facility: "Palisades Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Hunterdon",
          facility: "Hunterdon Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Mercer",
          facility: "Capital Health Regional Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Mercer",
          facility: "Capital Health System - Hopewell",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Mercer",
          facility: "Robert Wood Johnson University Hospital At Hamilton",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Mercer",
          facility: "St. Francis Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Middlesex",
          facility: "JFK Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Middlesex",
          facility: "Raritan Bay Medical Center - Old Bridge",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Middlesex",
          facility: "Raritan Bay Medical Center - Perth Amboy",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Middlesex",
          facility: "Robert Wood Johnson University Hospital",
          status: "Divert-Specialty Services",
          reason: "No Psychiatric Services",
          start_time: "10-18-2018 16:15",
          expire_time: "10-18-2018 20:15"
      },
      {
          county: "Middlesex",
          facility: "Saint Peter's University Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Middlesex",
          facility: "University Medical Center Of Princeton At Plainsboro",
          status: "Divert - Full/Total",
          reason: "Patient Volume",
          start_time: "10-18-2018 15:48",
          expire_time: "10-18-2018 19:48"
      },
      {
          county: "Monmouth",
          facility: "BAYSHORE MEDICAL CENTER",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Monmouth",
          facility: "CentraState Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Monmouth",
          facility: "Jersey Shore University Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Monmouth",
          facility: "Monmouth Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Monmouth",
          facility: "Riverview Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Morris",
          facility: "Chilton Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Morris",
          facility: "Morristown Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Morris",
          facility: "Saint Clare's Hospital/Denville",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Morris",
          facility: "Saint Clare's Hospital/Dover",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Ocean",
          facility: "Community Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Ocean",
          facility: "Monmouth Medical Center - Southern Campus",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Ocean",
          facility: "Ocean Care SED",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Ocean",
          facility: "Ocean Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Ocean",
          facility: "Southern Ocean Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Passaic",
          facility: "St. Joseph's Regional Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Passaic",
          facility: "St. Joseph's Wayne Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Passaic",
          facility: "St. Mary's Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Salem",
          facility: "Inspira Medical Center Elmer",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Salem",
          facility: "Memorial Hospital Of Salem County",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Somerset",
          facility: "Robert Wood Johnson University Hospital Somerset",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Sussex",
          facility: "Newton Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Sussex",
          facility: "Saint Clare's Sussex SED",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Union",
          facility: "JFK-Muhlenberg SED",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Union",
          facility: "Overlook Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Union",
          facility: "Overlook-Union SED",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Union",
          facility: "Robert Wood Johnson University Hospital At Rahway",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Union",
          facility: "Trinitas Regional Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Warren",
          facility: "Hackettstown Regional Medical Center",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      },
      {
          county: "Warren",
          facility: "St Luke's Warren Hospital",
          status: "Open",
          reason: "",
          start_time: "",
          expire_time: ""
      }
  ]

  hospitals.each do |h|
    p "Creating #{h[:facility]}"
    Hospital.create(name: h[:facility].titlecase, county: "#{h[:county]} County")
  end


  puts "Syncing with Hospital Divert System"

  HospitalStatusJob.perform_now


#   ["Fire", "Police", "EMS"].each do |e|
#     IncidentGroup.create(name: e)
#   end

#   l_uuids = Location.all.pluck(:id)
#   i_uuids = IncidentGroup.all.pluck(:id)

#   25.times do |n|
#     Incident.create(message: Faker::TvShows::Community.quotes,
#                     location_id: l_uuids[rand(1..Location.count)],
#                     incident_group_id: i_uuids[(1..IncidentGroup.count)],
#                     user_id: User.first.id,
#                     status: "Reported",
#                     created_at: Time.now - n.hours.ago,
#                     updated_at: Time.now - n.hours.ago
#     )
#   end

# end