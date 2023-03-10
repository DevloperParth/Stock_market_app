class CurrenciesController < ApplicationController

  def my_coins
    @current_user = current_user
  end
  
  def buy 
    @curency = Currency.find(params[:id])
    @user = current_user.quantities.find_or_initialize_by(currency_id: @curency["id"])
    @user.coin_quantity = @user.coin_quantity + 1
    @user.coin_quantity += params[:coin_quantity].to_i
    if @user.save
      redirect_to currencies_my_coins_path, notice: "Coin bought successfully"
    else
      render :buy
    end
  end    

  def sell
    @curency = Currency.find(params[:id])
    @user = current_user.quantities.find_or_initialize_by(currency_id: @curency["id"])
    if @user.coin_quantity > 0
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
