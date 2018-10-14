class CreateIncidentFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_flags do |t|

      t.references :user
      t.references :incident

      t.string :reason

      t.timestamps
    end
  end
end
