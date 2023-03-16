class AdminsController < ApplicationController

  def index
    @user = User.where(role: "user").all
  end

  def show 
    @profile = User.find(params[:id])
  end

  def edit
    @price = Currency.find(params[:id])
  end

  def update
    @price = Currency.find(params[:id])
    
    if @price.update(currency_params)
      redirect_to admins_index_path
    else
      redirect_to admins_index_path
    end
  end

  private

  def currency_params
    params.require(:currency).permit(:name, :price, :user_id)
  end

end
