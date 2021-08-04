module ApplicationHelper
  # in cart_has_more_than_one we check to see if @cart.line_items.count is greater than 0, then return the @cart.line_items.count as html 
  def cart_has_more_than_one
    if @cart.line_items.count > 0 
      return "<span>#{@cart.line_items.count}</span>".html_safe
    end
  end
# cart_has_item return @cart.line_items.count if its greater then 0, and use the methos in the navbar as a conditional statement
  def cart_has_item
    return @cart.line_items.count > 0 
  end
end
