class FoodItem < ApplicationRecord
  # profile belongs to the fooditem and profile is a foreign key in the fooditem table
  belongs_to :profile
  # food item belong to the buyer with profile, but for the user it will be optional to be a buyer
  belongs_to :buyer, class_name: "Profile", optional: true
# food item also belongs ot the seller, but for the seller in order to create food item list, the seller has to exist buy havinfg an account and creating a profile
  belongs_to :seller, class_name: "Profile"
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  # using enum to have a differnt type of food or diet, and useing select in the form for the food item 
  # this is for uploading an image, this will tell that we have many image to upload, we pass the attribute as a params in food item controller to be able for uploading the image, it can have multiple image for every food item, 
  has_many_attached :images
  # the food item can have many reviews form buyer
  has_many :reviews, dependent: :destroy

  private 
    def ensure_not_referenced_by_any_line_item
      unless line_item.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
