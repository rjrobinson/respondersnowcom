# frozen_string_literal: true

class Types::IncidentInputType < Types::BaseInputType
  graphql_name "IncidentInputType"

  description %(
    All the attributes needed to create an Incident.
    A full address ( street, city, state)
    or Lat/Long will be required to validate a correct address
  )

  argument :id, ID, required: false do
    description "Must pass ID for any mutation except Create"
  end

  argument :street, String, required: false
  argument :city, String, required: false
  argument :state, String, required: false

  argument :latitude, Float, required: false
  argument :longitude, Float, required: false


  # TODO Add Scene Type
  argument :scene_type, String, required: true
  argument :message, String, required: true
  argument :status, String, required: true
end
