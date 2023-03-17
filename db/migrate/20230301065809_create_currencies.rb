# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :price
      t.integer :user_id, null: true
      t.timestamps
    end
  end
end
