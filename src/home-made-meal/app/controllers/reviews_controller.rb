class ReviewsController < ApplicationController
  # for review I didn't use scaffold, just create model and controller form scratch 
  # user before action method for set_review only for show and destroy action to find the review with the params[:id] 
  before_action :set_review, only:[:show, :destroy]
  # in index action we query all the review that has recorder in db
  def index
    @reviews = Review.all
  end
  def show
  end
  # in new action we need to to find food_item_id because I passed the food item id as hidden field in the form in new.html.erb file with the value of @food_item.id
  def new
    @food_item = FoodItem.find(params[:food_item_id])
    @review = Review.new
  end
  # in create action we find the fooditem id for review and then will assing the food_item_id attribute to the food_item var and then we redirect to the show page we the query of food_item
  def create
    food_item = FoodItem.find(params[:review][:food_item_id])
    @review = Review.create(review_params)
    @review.food_item_id = food_item
    redirect_to show_path(food_item)
  end
  # for destroy action I haven't implement the button yet
  def destroy
    @review.destroy
    redirect_to show_path
  end
  private 
  # with set_review action we find specific review with the params id 
    def set_review
      @review = Review.find(params[:id])
    end
    # in the review action we require the review model and give the permition for only trusted attribute to be recorded on
    def review_params 
      params.require(:review).permit(:comment, :rating, :food_item_id)
    end
end
