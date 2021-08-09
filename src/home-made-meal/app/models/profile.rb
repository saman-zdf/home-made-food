class Profile < ApplicationRecord
  before_save :remove_whitespace
  # the profile belong to the user and user will just have one profile 
  belongs_to :user
  # profile has mnay food item, user can create as many food item
  has_many :food_item
  # user will have food item to sell for the join table which food tiem and seller id will be the foreign key for food item
  has_many :food_item_to_sell, class_name: "FoodItem", foreign_key: "seller_id"
  has_many :food_item_to_buy, class_name: "FoodItem", foreign_key: "buyer_id"
  # user can have many comment as buyer to make and as a seller to recieve
  has_many :comments_to_make, class_name: "FoodItem", foreign_key: "buyer_id"
  has_many :comments_to_receive, class_name: "FoodItem", foreign_key: "seller_id"
  has_one_attached :image
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :username, presence: true, length: { minimum: 2 }

  private
  # if there is any white space it will be removed before saving to the db
    def remove_whitespace
      self.first_name = self.first_name.strip
      self.last_name = self.last_name.strip
      self.username = self.username.strip
    end
end
