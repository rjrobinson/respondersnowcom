class AddSubExpiresDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sub_current, :boolean, default: false
    add_column :users, :sub_exp, :datetime
  end
end
