json.extract! food_item, :id, :name, :description, :availability, :food_type, :price, :buyer_id, :seller_id, :profile_id, :created_at, :updated_at
json.url food_item_url(food_item, format: :json)
