class Types::IncidentSceneType < Types::BaseObject
  field :name, String, null: false

  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.each {|e| {field_name: e, error: object.errors[e]}}
  end


end