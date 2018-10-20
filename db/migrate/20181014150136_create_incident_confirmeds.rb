class CreateIncidentConfirmeds < ActiveRecord::Migration[5.2]
  def change
    # Changed this to act as polymorphic
    create_table :confirmations, id: :uuid do |t|
      t.references :user, type: :uuid

      t.string :confirmable_id, type: :uuid
      t.string :confirmable_type

      t.timestamps
    end


  end
end
