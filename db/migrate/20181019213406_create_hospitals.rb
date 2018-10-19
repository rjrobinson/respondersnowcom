class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|

      t.string :name
      t.references :location, foreign_key: true
      t.string :abilities
      t.string :county
      t.timestamps
    end
  end
end
