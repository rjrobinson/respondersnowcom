class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes, id: :uuid do |t|

      t.references :user, type: :uuid, foreign_key: true

      t.string :voteable_id, type: :uuid
      t.string :voteable_type

      t.integer :vote_value, default: 0

      t.timestamps
    end
  end
end
