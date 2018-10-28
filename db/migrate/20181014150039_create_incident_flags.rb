class CreateIncidentFlags < ActiveRecord::Migration[5.2]
  def change

    # Changed this to act as polymorphic
    create_table :flags, id: :uuid do |t|

      t.references :user, type: :uuid, foreign_key: true

      t.string :flaggable_id, type: :uuid
      t.string :flaggable_type

      t.string :reason

      t.timestamps
    end
  end
end
