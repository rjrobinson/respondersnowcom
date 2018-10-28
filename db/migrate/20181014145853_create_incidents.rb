class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents, id: :uuid do |t|
      t.string :message
      t.references :location, type: :uuid, foreign_key: true
      t.references :incident_type, type: :uuid, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true, index: true

      t.string :status

      t.float :rank, default: 0, index: true

      t.boolean :archived, default: false

      t.datetime :ranked_at
      t.timestamps
    end
  end
end
