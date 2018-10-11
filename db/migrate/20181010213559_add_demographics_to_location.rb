class AddDemographicsToLocation < ActiveRecord::Migration[5.2]
  def change

    add_column :locations, :state, :string
    add_column :locations, :county, :string
    add_column :locations, :city, :string
    add_column :locations, :box, :string
    add_column :locations, :zipcode, :string

  end
end
