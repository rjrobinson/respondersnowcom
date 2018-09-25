class AddSuperUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :super_user, :boolean
  end
end
