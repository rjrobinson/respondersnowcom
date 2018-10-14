class Types::IncidentInputType < Types::BaseInputType
  graphql_name "IncidentInputType"
  description "All the attributes needed to create an Incident"

  argument :address, String, required: true
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
  field :incident_reports, [Types::IncidentReport], null: false


  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.each {|e| {field_name: e, error: object.errors[e]}}
  end
end