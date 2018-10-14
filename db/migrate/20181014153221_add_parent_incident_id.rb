class AddParentIncidentId < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :parent_incident_id, :integer
  end
end
