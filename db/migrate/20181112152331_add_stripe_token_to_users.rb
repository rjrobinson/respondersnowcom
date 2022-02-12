# frozen_string_literal: true

class AddStripeTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stripe_token, :string
  end
end
