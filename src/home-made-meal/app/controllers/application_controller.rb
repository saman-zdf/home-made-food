class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart
  before_action :subtotal


  private 
  # initializin the session for cart and it will be appended by product id 
    def initialize_session
      session[:cart] ||= []
    end
    # loadin out cart with the session with the value has passes
    def load_cart
      @cart = FoodItem.find(session[:cart])
    end
    def after_sign_in_path_for(profile)
      if current_user.profile
        new_food_item_path
      else
        new_profile_path || root_path 
      end
    end

    def subtotal 
      @subtotal = @cart.collect{|p| p.price.to_i}.sum
      
    end
end
