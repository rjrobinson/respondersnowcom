class CreateWorkHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :work_histories do |t|

      t.integer :user_id
      t.integer :agency_id

      t.datetime :start_date
      t.datetime :end_date

      t.string :status # full-time ? part-time? volunteer? per-diem?
      t.string :title # EMT? Paramedic? EMD?

      t.boolean :current
      # revisit this later, as you may create a special role for users.

      t.timestamps null: false
    end
  end
end

