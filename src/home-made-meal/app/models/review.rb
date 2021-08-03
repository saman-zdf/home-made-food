class Review < ApplicationRecord
  # the review belongs to the food_item and each food item can have many reviews
  belongs_to :food_item
end
