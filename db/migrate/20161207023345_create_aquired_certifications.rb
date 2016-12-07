class CreateAquiredCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :aquired_certifications do |t|

      t.references :responder
      t.references :certification

      t.string :number # Certification Number

      t.date :aquired
      t.date :expires

      t.boolean :primary

      # Add training site later

      t.timestamps
    end
  end
end
