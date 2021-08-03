module CurrentCart
  # Initilzing the CurrentCart as a helper and include this helper in application controller to have a acees to it in other controller 
  private 
  # in the set_cart method we assign the @cart to find the cart with the session[:cart_id] which comes from browser, if there is no record we don't want to get an error, using rescue method if @cart is empty shown record not found and it will create a new cart and then we assign the session[:cart_id] to @cart.id which has been created alredy 
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create 
      session[:cart_id] = @cart.id
    end
end