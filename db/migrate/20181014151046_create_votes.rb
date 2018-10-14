class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :user
      t.references :incident

      t.integer :vote_value

      t.timestamps
    end
  end
end
