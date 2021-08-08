class HomeController < ApplicationController
  after_action :delete_cart
  def hero 
    
  end

  def index
    # assign user_type to params[:user_type] if the params[:user_type] exist
    @user_type = params[:user_type] if params[:user_type]
    @q = FoodItem.ransack(params[:q])
    @food_items = @q.result(distinct: true)
  end
  def show
    @food_item = FoodItem.find(params[:id])
    if params[:checkout] == "success"
      @food_item.buyer_id = current_user.profile.id 
      @food_item.sales_quantity += 1
      @food_item.save
    end
  end

  private
    def delete_cart
      if params[:checkout] == "success"
        @cart.line_items.delete_all
      end
  end
end
