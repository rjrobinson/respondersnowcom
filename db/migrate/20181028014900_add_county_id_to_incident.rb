class AddCountyIdToIncident < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :county_id, :uuid
  end
end
