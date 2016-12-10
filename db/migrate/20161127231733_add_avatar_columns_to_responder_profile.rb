class AddAvatarColumnsToResponderProfile < ActiveRecord::Migration[5.0]
  def change
    add_attachment :responder_profiles, :avatar
  end
end
