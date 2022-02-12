# frozen_string_literal: true

class Dothings < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_statuses, id: :uuid do |t|
      t.string :county

      t.references :hospital, type: :uuid, foreign_key: true
      t.string :status
      t.string :reason

      t.datetime :start_time
      t.datetime :expire_time

      t.timestamps
    end
  end
end
