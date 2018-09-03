class CreateAcquiredCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :acquired_certifications do |t|

      t.references :responder

      t.references :certification

      t.string :number # Certification Number

      t.date :acquired_on

      t.boolean :expires

      t.date :expires_on

      t.boolean :primary

      t.boolean :legit, default: false

      t.timestamps
    end
  end
end
