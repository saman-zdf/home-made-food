class ChangeDataTypeForFoodItems < ActiveRecord::Migration[6.0]
  def change
    change_column :food_items, :food_type, :string
  end
end
