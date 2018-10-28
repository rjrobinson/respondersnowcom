class CreateIncidentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_reports, id: :uuid do |t|
      t.string :message
      t.references :user, type: :uuid, foreign_key: true
      t.references :incident, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
