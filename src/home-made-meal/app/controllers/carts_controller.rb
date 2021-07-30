class CartsController < ApplicationController
  def index
    @food_item = FoodItem.find(session[:cart])
  end
end
