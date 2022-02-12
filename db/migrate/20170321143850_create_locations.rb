# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :uuid
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
