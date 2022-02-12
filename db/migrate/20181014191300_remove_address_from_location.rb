# frozen_string_literal: true

class RemoveAddressFromLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :address, :string

    add_column :locations, :country, :string, default: "US"
  end
end
