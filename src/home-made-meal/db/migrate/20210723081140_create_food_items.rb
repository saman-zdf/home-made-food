class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.text :description
      t.boolean :availability
      t.integer :food_type
      t.float :price
      t.integer :buyer_id
      t.integer :seller_id, null: false
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
