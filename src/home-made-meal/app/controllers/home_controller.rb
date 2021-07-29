class HomeController < ApplicationController
  def index
    @user_type = params[:user_type] if params[:user_type]
    @food_items = FoodItem.all
  end
end
