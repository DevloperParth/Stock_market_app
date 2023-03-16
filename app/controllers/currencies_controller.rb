class CurrenciesController < ApplicationController

  def index
  end

  def my_coins
  end
  
  def buy 
    @currency = Currency.find(params[:id])
    @user = current_user.quantities.find_or_initialize_by(currency_id: @currency["id"])
    if current_user.my_money >= @currency.price.to_i
      current_user.my_money = current_user.my_money - @currency.price.to_i
      current_user.save
      @currency.previous_price = @currency.price.to_i
      @currency.save
      @user.coin_quantity = @user.coin_quantity + 1
      @user.coin_quantity += params[:coin_quantity].to_i
      if @user.save
        redirect_to currencies_my_coins_path, notice: "Coin bought successfully"
      else
        render :buy
      end
    else
      redirect_to wallets_edit_path, notice: "Not enough money, please add required amount."
    end
  end    

  def sell
    @currency = Currency.find(params[:id])
    @user = current_user.quantities.find_or_initialize_by(currency_id: @currency["id"])
    if @user.coin_quantity > 0
      @admin = User.find_by(role: "admin")
      @admin.my_money += (@currency.previous_price.to_i)/100
      @admin.save
      current_user.my_money = current_user.my_money + (@currency.previous_price.to_i - @currency.previous_price.to_i/100)
      current_user.save
      @user.coin_quantity = @user.coin_quantity - 1
      @user.coin_quantity += params[:coin_quantity].to_i
      if @user.save
        redirect_to currencies_my_coins_path, notice: "Coin sold successfully"
      else
        render :buy
      end
    else
      redirect_to currencies_my_coins_path
    end
  end

end
