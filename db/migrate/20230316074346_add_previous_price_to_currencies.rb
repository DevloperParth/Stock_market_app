class AddPreviousPriceToCurrencies < ActiveRecord::Migration[7.0]
  def change
    add_column :currencies, :previous_price, :string
  end
end
