class Profile < ApplicationRecord
  # the profile belong to the user and user will just have one profile 
  belongs_to :user
  # profile has mnay food item, user can create as many food item
  has_many :food_item
  # user will have food item to sell for the join table which food tiem and seller id will be the foreign key for food item
  has_many :food_item_to_sell, class_name: "FoodItem", foreign_key: "seller_id"
  has_many :food_item_to_buy, class_name: "FoodItem", foreign_key: "buyer_id"
  enum states: {NSW: 0, Victoria: 1, Queensland: 2, SA: 3, WA: 4, Tasmania: 5  }
end
