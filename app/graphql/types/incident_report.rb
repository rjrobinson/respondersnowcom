class Types::IncidentReport < Types::BaseObject
  description "A list of reports, who updated them, and when."

  field :message, String, null: false

  field :user, Types::UserType, null: false

  field :created_at, String, null: false
  field :updated_at, String, null: false


  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.each {|e| {field_name: e, error: object.errors[e]}}
  end


end