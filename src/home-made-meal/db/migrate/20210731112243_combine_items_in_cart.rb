class CombineItemsInCart < ActiveRecord::Migration[6.0]
  def up
    # replace several items for a single food tiem in a cart with a single item
    Cart.all.each do |cart|
      sums = cart.line_items.group(:food_item_id).sum(:quantity)
      # it will count the number of each food item in the cart 
      sums.each do |food_item_id, quantity|
        if quantity > 1
          # it will remove the single item  if its repeated 
          cart.line_items.where(food_item_id: food_item_id).delete_all
          # replace with the single item and the sum of it
          item = cart.line_items.build(food_item_id: food_item_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # split items which has a quantity greater than 1 into several items 
    LineItem.where("quantity>1").each do |line_item|
      # add individual item 
      line_item.quantity.times do 
        LineItem.create(
          cart_id: line_item.cart_id,
          food_item_id: line_item.food_item_id,
          quantity: 1
        )
        # remove the original item 
        line_item.destroy
      end
    end
  end
end
