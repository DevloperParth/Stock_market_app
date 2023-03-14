class CurrenciesController < ApplicationController

  def my_coins
    @current_user = current_user
  end
  
  def buy 
    @curency = Currency.find(params[:id])
    @user = current_user.quantities.find_or_initialize_by(currency_id: @curency["id"])
    if current_user.my_money >= @curency.price.to_i
      current_user.my_money = current_user.my_money - @curency.price.to_i
      current_user.save
      @user.coin_quantity = @user.coin_quantity + 1
      @user.coin_quantity += params[:coin_quantity].to_i
      if @user.save
        redirect_to currencies_my_coins_path, notice: "Coin bought successfully"
      else
        render :buy
      end
    else
      redirect_to wallets_index_path, flash: {notice: "Not enough money, please add required amount."}
    end
  end    

  def sell
    @curency = Currency.find(params[:id])
    @user = current_user.quantities.find_or_initialize_by(currency_id: @curency["id"])
    if @user.coin_quantity > 0
      current_user.my_money = current_user.my_money + @curency.price.to_i
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

  private

   def currency_params
    params.require(:currency).permit(:name, :price)
   end
   
   def quantity_params
    params.require(:quantity).permit(:coin_quantity)
   end
end
