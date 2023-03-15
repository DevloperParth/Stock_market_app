class HistoriesController < ApplicationController
  def index
    @history = current_user.quantities.find_all
  end
end
