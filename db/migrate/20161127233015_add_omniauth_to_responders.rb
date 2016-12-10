class AddOmniauthToResponders < ActiveRecord::Migration[5.0]
  def change
    add_column :responders, :provider, :string
    add_column :responders, :uid, :string
  end
end
