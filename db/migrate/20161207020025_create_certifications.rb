class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications do |t|

      t.string :name

      t.string :course_code

      t.string :state

      t.string :abbvr


      t.timestamps
    end
  end
end
