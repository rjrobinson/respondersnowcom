class DeviseCreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies do |t|

      t.string :email, null: false, default: ""

      t.string :name

      t.string :level

      t.integer :location_id

      t.timestamps null: false
    end

    add_index :agencies, :email, unique: true
    add_index :agencies, :name, unique: true
  end
end