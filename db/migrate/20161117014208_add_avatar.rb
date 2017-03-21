class AddAvatar < ActiveRecord::Migration[5.0]
  def change
    add_attachment :responders, :avatar
  end
end
