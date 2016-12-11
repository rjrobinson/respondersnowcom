class CreateAquiredCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :aquired_certifications do |t|

      t.references :responder
      t.references :certification

      t.string :number # Certification Number

      t.date :aquired_on
      t.boolean :expires
      t.date :expires_on

      t.boolean :primary

      t.boolean :legit, default: false

      t.attachment :document

      # Add training site later

      t.timestamps
    end
  end
end
