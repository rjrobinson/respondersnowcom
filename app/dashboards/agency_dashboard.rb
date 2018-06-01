require "administrate/base_dashboard"

class AgencyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    location: Field::BelongsTo,
    id: Field::Number,
    email: Field::String,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    level: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :location,
    :id,
    :email,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :location,
    :id,
    :email,
    :name,
    :created_at,
    :updated_at,
    :level,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :location,
    :email,
    :name,
    :level,
  ].freeze

  # Overwrite this method to customize how agencies are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(agency)
  #   "Agency ##{agency.id}"
  # end
end
