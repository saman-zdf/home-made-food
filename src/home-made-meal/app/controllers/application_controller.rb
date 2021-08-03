class ApplicationController < ActionController::Base
  # we include CurrentCart from concern dir in appcontroller to have an access to the helper method which is set_cart and using before_action that we can use the method before any other action anywhere it needed
  include CurrentCart
  before_action :set_cart
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
end
