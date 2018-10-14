class AddStreetToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :street, :string
  end
end
