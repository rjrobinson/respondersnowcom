# frozen_string_literal: true

module Types
  class IncidentInputType < Types::BaseInputType
    graphql_name "IncidentInputType"

    description %(
    All the attributes needed to create an Incident.
    A full address ( street, city, state)
    or Lat/Long will be required to validate a correct address
  )

    argument :id, ID, required: false do
      description "Must pass ID for any mutation except Create"
    end

    argument :city, String, required: false
    argument :county, String, required: false
    argument :formatted_address, String, required: false
    argument :incident_group_id, ID, required: false
    argument :incident_status_id, ID, required: false
    argument :lat, Float, required: false
    argument :lng, Float, required: false
    argument :message, String, required: false
    argument :state, String, required: false
    argument :street, String, required: false
    argument :street_number, String, required: false
  end
end
