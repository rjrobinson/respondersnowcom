# frozen_string_literal: true

class Types::IncidentType < Types::ActiveRecordBase
  implements Types::NodeType

  description "The base of an submission"

  field :id, ID, null: false

  field :confirmations, [Types::ConfirmationType], null: true
  field :confirmed, Boolean, null: false
  field :downvotes, Int, null: false
  field :flags, [Types::FlagType], null: true
  field :incident_reports, [Types::IncidentReport], null: false
  field :incident_type, Types::IncidentGroupType, null: false
  field :location, Types::LocationType, null: false
  field :message, String, null: false
  field :rank, Float, null: false
  field :ranked_at, String, null: true
  field :score, Int, null: false
  field :status, Types::IncidentStatusType, null: true
  field :upvotes, Int, null: false
  field :user, Types::UserType, null: false

  def confirmed
    object.confirmations.count >= 3
  end
end
