json.extract! profile, :id, :first_name, :last_name, :username, :street_number, :street_name, :suburb, :postcode, :state, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
