class ChangeColumnNameForIncidentGroup < ActiveRecord::Migration[5.2]
  def change
    rename_column :incidents, :incident_type_id, :incident_group_id
  end
end
