class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart
  before_action :subtotal
  before_action :set_user
# set user action will give the option to distiguish the user who using the apps, if user is seller or buyer or returning user
  def set_user
    @user_type = params[:user_type]
  end
    # the after sign in action will allow the seller to create a profile if doesn't have one, and then redirect it to the new food item to add to its listing
  def after_sign_in_path_for(profile)
    if (current_user.profile)
      #  if the user either is buyer or returning_user it will take the user to the root path 
      if (params[:user][:user_type] == "buyer") || (params[:user][:user_type] == "returning_user")
        root_path
      else
        new_food_item_path
      end
    else
      new_profile_path(user_type: params[:user][:user_type] ) || root_path 
    end
  end
  private 
  # initializin the session for cart and it will be appended by product id 
    def initialize_session
      session[:cart] ||= []
    end
    # loading the cart which has assign to the session[:cart] which has the params[:id] of food_item in it, when from FoodItem controller we add to the cart the item will be appended into the session[:cart] and if we remove from cart it will be deleted form session cart
    def load_cart
      @cart = FoodItem.find(session[:cart])
    end
    #  the subtotal action will calcualte the total of the item prices in the current shopping cart and will display it inside shopping cart page buy using the @subtotal instance variables 
    def subtotal 
      @subtotal = @cart.collect{|p| p.price.to_i}.sum
    end
end
