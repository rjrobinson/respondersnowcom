class Types::IncidentInputType < Types::BaseInputType
  graphql_name "IncidentInputType"
  description %(
    All the attributes needed to create an Incident.
    A full address ( street, city, state)
    or Lat/Long will be required to validate a correct address
  )

  argument :street, String, required: false
  argument :city, String, required: false
  argument :state, String, required: false

  argument :latitude, Float, required: false
  argument :longitude, Float, required: false


  argument :scene_type, String, required: true
  argument :message, String, required: true
  argument :status, String, required: false

end


class Types::IncidentType < Types::BaseObject

  description "The base of an submission"

  field :id, ID, null: false
  field :location, Types::LocationType, null: false
  field :incident_type, Types::IncidentSceneType, null: false
  field :message, String, null: false
  field :user, UserType, null: false

  field :created_at, String, null: false
  field :updated_at, String, null: false
  field :status, String, null: false
  field :rank, Int, null: false
  field :incident_reports, [Types::IncidentReport], null: false


  field :upvotes, Int, null: false
  field :downvotes, Int, null: false
  field :score, Int, null: false

end