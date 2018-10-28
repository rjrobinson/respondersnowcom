# frozen_string_literal: true

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
  field :rank, Float, null: false
  field :ranked_at, String, null: true

  field :incident_reports, [Types::IncidentReport], null: false


  field :confirmed, Boolean, null: false
  field :confirmations, [Types::ConfirmationType], null: true

  field :upvotes, Int, null: false
  field :downvotes, Int, null: false
  field :score, Int, null: false

  field :flags, [Types::FlagType], null: true
  
  def confirmed
    object.confirmations.count > 1
  end
end
