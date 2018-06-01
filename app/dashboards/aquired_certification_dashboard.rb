require "administrate/base_dashboard"

class AquiredCertificationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    responder: Field::BelongsTo,
    certification: Field::BelongsTo,
    id: Field::Number,
    number: Field::String,
    aquired_on: Field::DateTime,
    expires: Field::Boolean,
    expires_on: Field::DateTime,
    primary: Field::Boolean,
    legit: Field::Boolean,
    document_file_name: Field::String,
    document_content_type: Field::String,
    document_file_size: Field::Number,
    document_updated_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :responder,
    :certification,
    :id,
    :number,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :responder,
    :certification,
    :id,
    :number,
    :aquired_on,
    :expires,
    :expires_on,
    :primary,
    :legit,
    :document_file_name,
    :document_content_type,
    :document_file_size,
    :document_updated_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :responder,
    :certification,
    :number,
    :aquired_on,
    :expires,
    :expires_on,
    :primary,
    :legit,
    :document_file_name,
    :document_content_type,
    :document_file_size,
    :document_updated_at,
  ].freeze

  # Overwrite this method to customize how aquired certifications are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(aquired_certification)
  #   "AquiredCertification ##{aquired_certification.id}"
  # end
end
