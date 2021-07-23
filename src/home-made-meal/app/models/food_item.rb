class FoodItem < ApplicationRecord
  belongs_to :profile
  belongs_to :buyer, class_name: "Profile", optional: true
  belongs_to :seller, class_name: "Profile"
  enum food_types: {Carnivore: 0, Vegeterian: 1, Vegan: 2}
end
