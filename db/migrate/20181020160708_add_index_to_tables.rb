# frozen_string_literal: true

class AddIndexToTables < ActiveRecord::Migration[5.2]
  def change
    add_index :confirmations, [:confirmable_id, :confirmable_type]
    add_index :confirmations, [:confirmable_id, :user_id]

    add_index :flags, [:flaggable_id, :flaggable_type]
    add_index :flags, [:flaggable_id, :user_id]

    add_index :votes, [:voteable_id, :user_id]
    add_index :votes, [:voteable_id, :vote_value]
  end
end
