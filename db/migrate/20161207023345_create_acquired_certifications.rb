# frozen_string_literal: true

class CreateAcquiredCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :acquired_certifications, id: :uuid do |t|
      t.references :user, type: :uuid

      t.references :certification, type: :uuid

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
