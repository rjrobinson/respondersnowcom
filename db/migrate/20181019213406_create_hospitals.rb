# frozen_string_literal: true

class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals, id: :uuid do |t|
      t.string :name
      t.references :location, type: :uuid, foreign_key: true
      t.string :abilities
      t.string :county
      t.timestamps
    end
  end
end
