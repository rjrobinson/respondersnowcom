class Types::UserType < Types::BaseObject

  field :id, ID, null: false
  field :full_name, String, null: false
  field :display_id, ID, null: false

  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.each {|e| {field_name: e, error: object.errors[e]}}
  end


end


# 25.times do |n|
#   Incident.create(message: Faker::MichaelScott.quote,
#                   location_id: rand(1..Location.count),
#                   incident_type_id: rand(1..IncidentType.count),
#                   submitted_by: User.first.id,
#                   status: "On Going"
#
#   )
# end