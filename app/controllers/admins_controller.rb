class AdminsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.all
    render json: @user, status: :ok
  end
end
