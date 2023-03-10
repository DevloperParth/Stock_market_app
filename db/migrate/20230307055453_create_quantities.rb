class CreateQuantities < ActiveRecord::Migration[7.0]
  def change
    create_table :quantities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.integer :coin_quantity, default: 0

      t.timestamps
    end
  end
end
