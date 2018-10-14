class RemoveSubmittedBy < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :user_id, :integer
    add_index :incidents, :user_id

    remove_column :incidents, :submitted_by, :integer
  end
end
