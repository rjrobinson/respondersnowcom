class AddFlaggedToIncident < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :flagged, :boolean, default: false
  end
end
