class LineItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :cart
  # to get the total price of the food item if its more than one we need to multiply the food item price to the quantity of the food item 
  def total_price
    food_item.price * quantity
  end
end
