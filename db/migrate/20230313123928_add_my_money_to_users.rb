# frozen_string_literal: true

class AddMyMoneyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :my_money, :integer, default: 0
  end
end
