require "administrate/base_dashboard"

class AcquiredCertificationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    certification: Field::BelongsTo,
    file_attachment: Field::HasOne,
    file_blob: Field::HasOne,
    id: Field::Number,
    number: Field::String,
    acquired_on: Field::DateTime,
    state: Field::String,
    expires: Field::Boolean,
    expires_on: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :certification,
    :file_attachment,
    :file_blob,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :certification,
    :file_attachment,
    :file_blob,
    :id,
    :number,
    :acquired_on,
    :state,
    :expires,
    :expires_on,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :certification,
    :file_attachment,
    :file_blob,
    :number,
    :acquired_on,
    :state,
    :expires,
    :expires_on,
  ].freeze

  # Overwrite this method to customize how acquired certifications are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(acquired_certification)
  #   "AcquiredCertification ##{acquired_certification.id}"
  # end
end
