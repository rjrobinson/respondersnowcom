class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications do |t|

      t.string :name

      t.integer :default_ceus # num of CEUS
      
      t.timestamps
    end
  end
end
