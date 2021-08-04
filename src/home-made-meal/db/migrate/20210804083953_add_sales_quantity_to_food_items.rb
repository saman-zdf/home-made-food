class AddSalesQuantityToFoodItems < ActiveRecord::Migration[6.0]
  def change
    add_column :food_items, :sales_quantity, :integer, default: 0
  end
end
