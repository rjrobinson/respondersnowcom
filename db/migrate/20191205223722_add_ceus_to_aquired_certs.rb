# frozen_string_literal: true

class AddCeusToAquiredCerts < ActiveRecord::Migration[5.2]
  def change
    add_column :acquired_certifications, :ceus, :integer, default: 0
  end
end
