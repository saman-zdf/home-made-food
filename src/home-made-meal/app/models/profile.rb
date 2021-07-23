class Profile < ApplicationRecord
  belongs_to :user
  has_many :food_item
  has_many :food_item_to_sell, class_name: "FoodItem", foreign_key: "seller_id"
  has_many :food_item_to_buy, class_name: "FoodItem", foreign_key: "buyer_id"
  enum states: {NSW: 0, Victoria: 1, Queensland: 2, SA: 3, WA: 4, Tasmania: 5  }
end
