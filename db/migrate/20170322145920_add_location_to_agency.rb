class AddLocationToAgency < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :location_id, :integer
    add_column :agencies, :level, :string
  end
end
