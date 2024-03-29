# frozen_string_literal: true

class CreateIncidentStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_statuses, id: :uuid do |t|
      t.string :name
      t.string :abvr
      t.integer :code

      t.timestamps
    end
  end
end
