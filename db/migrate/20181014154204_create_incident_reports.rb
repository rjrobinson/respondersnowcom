class CreateIncidentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_reports do |t|
      t.string :message
      t.references :user, foreign_key: true
      t.references :incident, foreign_key: true

      t.timestamps
    end
  end
end
