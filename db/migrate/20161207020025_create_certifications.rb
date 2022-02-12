# frozen_string_literal: true

class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications, id: :uuid do |t|
      t.string :name

      t.string :course_code

      t.boolean :primary, default: false

      t.string :abbvr

      t.timestamps
    end
  end
end
