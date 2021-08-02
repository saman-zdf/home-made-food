module ApplicationHelper
  # cerate a helpere method and it will be used in app controller, if the session[:order_id] is not empty which comming from browser we want return the order with the session[:order_id], else we need to create a new order
  # def current_order 
  #   if !session[:order_id].nil?
  #     Order.find(session[:order_id])
  #   else
  #     Order.new
  #   end
  # end
end
