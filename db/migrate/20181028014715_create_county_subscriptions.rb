class CreateCountySubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :county_subscriptions, id: :uuid do |t|

      t.references :user, type: :uuid, foreign_key: true
      t.references :county, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
