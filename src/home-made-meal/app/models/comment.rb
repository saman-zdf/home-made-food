class Comment < ApplicationRecord
  belongs_to :food_item
  validates :name, presence: true 
  validates :content, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
end
