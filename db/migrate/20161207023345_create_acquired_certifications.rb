class CreateAcquiredCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :acquired_certifications do |t|

      t.references :user

      t.references :certification

      t.string :number # Certification Number

      t.date :acquired_on

      t.string :state

      t.boolean :expires

      t.date :expires_on

      t.date :acquired_on

      t.timestamps
    end
  end
end
