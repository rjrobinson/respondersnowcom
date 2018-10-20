class AddRankToIncident < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :rank, :float, default: 0, index: true
    add_column :incidents, :ranked_at, :datetime

  end
end
