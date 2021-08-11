module ApplicationHelper
  # in cart_has_more_than_one we check to see if @cart.line_items.count is greater or equal to 0, then return the @cart.line_items.count 
  def cart_count_items
    if @cart.line_items.count >= 0 
      return "<span>#{@cart.line_items.count}</span>".html_safe
    end
  end

  def has_role?(role)
    current_user && current_user.has_role?(role)
  end
end
