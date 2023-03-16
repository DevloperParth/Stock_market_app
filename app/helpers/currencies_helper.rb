module CurrenciesHelper

  def loss(data)
    data.currency[:price].to_i - data.currency[:previous_price].to_i
  end

  def profit(data)
    data.currency[:previous_price].to_i - data.currency[:price].to_i
  end
  
end
