class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # the add_food_item method will check if the list of items already includes the item we adding, if it does it will show the quantity and if it doesn't it will build a new line items for the user 
  def add_food_item(food_item)
    current_item = line_items.find_by(food_item_id: food_item.id)
      if current_item
        # I couldn't do increment by adding current_item.quantity += 1, for "+" it would return an error for undifined method for "+", I used increment bulit in method from ruby and it workd fine
        current_item.increment!(:quantity)
      else
        current_item = line_items.build(food_item_id: food_item.id)
      end
    current_item
  end
  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end
end
