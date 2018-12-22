class ChangeColumnForStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :incidents, :status, :string

    add_column :incident_groups, :abvr, :string
    add_column :incidents, :incident_status_id, :uuid
  end

end
