class WalletsController < ApplicationController

  def index
  end

  def edit
  end

  def update
    @user = current_user
    @user.my_money = @user.my_money + params[:my_money].to_i
   
    if @user.save
      redirect_to wallets_index_path
    else 
      render :edit
    end
  end
  
end
