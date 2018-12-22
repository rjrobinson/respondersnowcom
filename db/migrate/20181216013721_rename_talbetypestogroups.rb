class RenameTalbetypestogroups < ActiveRecord::Migration[5.2]
  def up
    rename_table :incident_types, :incident_groups
  end

  def down
    rename_table :incident_groups, :incident_types
  end
end
