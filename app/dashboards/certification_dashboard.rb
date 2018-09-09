require "administrate/base_dashboard"

class CertificationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    creator: Field::Polymorphic,
    id: Field::Number,
    name: Field::String,
    course_code: Field::String,
    default_ceus: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    active: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :creator,
    :id,
    :name,
    :course_code,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :creator,
    :id,
    :name,
    :course_code,
    :default_ceus,
    :created_at,
    :updated_at,
    :active,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :creator,
    :name,
    :course_code,
    :default_ceus,
    :active,
  ].freeze

  # Overwrite this method to customize how certifications are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(certification)
  #   "Certification ##{certification.id}"
  # end
end
