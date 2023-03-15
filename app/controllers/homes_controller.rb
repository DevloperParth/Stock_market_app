class HomesController < ApplicationController
  def index
    @currency = Currency.all
  end
end
