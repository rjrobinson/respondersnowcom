require "administrate/base_dashboard"

class WorkHistoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
      agency: Field::BelongsTo,
      user: Field::BelongsTo,
      id: Field::Number,
      start_date: Field::DateTime,
      end_date: Field::DateTime,
      status: Field::String,
      title: Field::String,
      current: Field::Boolean,
      created_at: Field::DateTime,
      updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :agency,
    :user,
    :id,
    :start_date,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :agency,
    :user,
    :id,
    :start_date,
    :end_date,
    :status,
    :title,
    :current,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :agency,
    :user,
    :start_date,
    :end_date,
    :status,
    :title,
    :current,
  ].freeze

  # Overwrite this method to customize how work histories are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(work_history)
  #   "WorkHistory ##{work_history.id}"
  # end
end