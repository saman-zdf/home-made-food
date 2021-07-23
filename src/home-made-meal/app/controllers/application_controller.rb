class ApplicationController < ActionController::Base

  # def after_sign_in_path_for(resource)
  #   if resource.class == FoodItem
  #     new_food_item_path
  #   else
  #     new_food_item_path || root_path
  #   end
  # end
  private 
    def after_sign_in_path_for(profile)
      if current_user.profile 
        new_food_item_path
      else
        new_profile_path || root_path 
      end
    end
end
