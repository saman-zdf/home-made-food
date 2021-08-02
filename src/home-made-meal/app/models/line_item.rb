class LineItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :cart
  def total_price
    food_item.price * quantity
  end
end
