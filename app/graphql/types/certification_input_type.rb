# frozen_string_literal: true
module Types
  class CertificationInputType < Types::BaseInputType
    description "Certification Input Type. To create or edit one"

    argument :id, ID, required: false
    argument :abbvr, String, required: true
    argument :active, Boolean, required: false
    argument :course_code, String, required: true
    argument :name, String, required: false
  end
end
