class CreateIncidentConfirmeds < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_confirmeds do |t|
      t.references :user
      t.references :incident

      t.timestamps
    end
  end
end
