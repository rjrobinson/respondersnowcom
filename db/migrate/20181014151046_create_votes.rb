class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :incident, foreign_key: true

      t.integer :vote_value, default: 0

      t.timestamps
    end
  end
end
