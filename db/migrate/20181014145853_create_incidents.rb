class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.string :message
      t.references :location
      t.references :incident_type
      t.integer :submitted_by

      t.timestamps
    end
  end
end
