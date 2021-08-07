class AddFoodItemIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :food_item_id, :integer
  end
end
