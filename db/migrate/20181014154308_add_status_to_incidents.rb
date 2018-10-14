class AddStatusToIncidents < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :status, :string
  end
end
