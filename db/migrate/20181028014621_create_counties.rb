# frozen_string_literal: true

class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties, id: :uuid do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
