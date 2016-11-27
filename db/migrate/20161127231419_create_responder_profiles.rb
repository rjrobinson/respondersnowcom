class CreateResponderProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :responder_profiles do |t|

      t.integer :responder_id
      t.integer :zipcode


      t.timestamps
    end
  end
end
