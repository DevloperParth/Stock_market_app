class CurrenciesController < ApplicationController

  def index
    @curency = Currency.find(params[:id])
    @curency.update(user_id:current_user.id)
    # @user = currenty_user.name = @curency["name"], currenty_user.price = @curency["price"]
  end

  private
   def currency_params
    params.require(:currency).permit(:name, :price)
   end
end
