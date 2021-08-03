class HomeController < ApplicationController
  def hero 
    
  end

  def index
    # assign user_type to params[:user_type] if the params[:user_type] exist
    @user_type = params[:user_type] if params[:user_type]
    #  assignig food_items to FoodItem.all that we can access to all the item in fooditem and to show all the food item in the home index page
    @food_items = FoodItem.all
  end
  def show
    @food_item = FoodItem.find(params[:id])
    @reviews = Review.all
  end
end
