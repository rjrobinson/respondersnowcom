class Types::HospitalStatusType < Types::BaseObject

  field :id, ID, null: false
  field :county, String, null: false
  field :status, String, null: false
  field :reason, String, null: false
  field :start_time, String, null: false
  field :expire_time, String, null: false
  field :created_at, String, null: false
  field :updated_at, String, null: false

end
