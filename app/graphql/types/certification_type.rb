# frozen_string_literal: true

class Types::CertificationType < Types::ActiveRecordBase

  field :id, ID, null: false

  field :abvr, String, null: false
  field :active, Boolean, null: false
  field :course_code, String, null: false
  field :name, String, null: false
  #field :user, Types::UserType, null: false
  #
  #
  #def user
  #  object.creator
  #end

end
