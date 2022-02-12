# frozen_string_literal: true

class AddColumnsToCertifications < ActiveRecord::Migration[5.1]
  def change
    add_column :certifications, :active, :boolean
    add_column :certifications, :creator_id, :integer
    add_column :certifications, :creator_type, :string
  end
end
