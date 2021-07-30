Rails.application.routes.draw do
  # devise_for :users
  resources :food_items
  resources :profiles
  root to: 'home#index'

  devise_scope :user do
    get "/login", :to => "devise/sessions#new" # Add a custom sign in route for user sign in
    delete "/logout", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign out
    get "/sign_up", :to => "devise/registrations#new" # Add a Custom Route for Registrations
    get "/profile", :to => "devise/registrations#edit" # Add a Custom Routes for Editing the Profile 
    devise_for :user
  end
  post "food_items/add_to_cart/:id", to: "food_items#add_to_cart", as: "add_to_cart"
  delete "food_items/remove_from_cart/:id", to: "food_items#remove_from_cart", as: "remove_from_cart"
  get "carts/index", to: 'carts#index', as: "cart"
  post "payment/index", to: "payment#create", as: "payment"

end
