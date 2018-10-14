class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.string :message
      t.references :location, foreign_key: true
      t.references :incident_type, foreign_key: true
      t.integer :submitted_by

      t.timestamps
    end

    add_index :incidents, :id
  end
end
