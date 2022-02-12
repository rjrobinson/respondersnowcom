# frozen_string_literal: true

class CreateMeritActivityLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :merit_activity_logs do |t|
      t.integer  :action_id
      t.string   :related_change_type
      t.integer  :related_change_id
      t.string   :description
      t.datetime :created_at
    end
  end
end
