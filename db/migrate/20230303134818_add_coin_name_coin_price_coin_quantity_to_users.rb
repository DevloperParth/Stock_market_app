# frozen_string_literal: true

class AddCoinNameCoinPriceCoinQuantityToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :coin_name, :string
    add_column :users, :coin_price, :integer
    add_column :users, :coin_quantity, :integer, default: 0
  end
end
