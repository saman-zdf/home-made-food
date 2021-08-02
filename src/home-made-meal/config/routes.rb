Rails.application.routes.draw do
  root to: 'home#hero'
  get "home/:id", to: "home#show", as: "show"
  resources :line_items
  resources :carts
  resources :food_items
  resources :profiles
  devise_scope :user do
    get "/login", :to => "devise/sessions#new" # Add a custom sign in route for user sign in
    delete "/logout", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign out
    get "/sign_up", :to => "devise/registrations#new" # Add a Custom Route for Registrations
    get "/profile", :to => "devise/registrations#edit" # Add a Custom Routes for Editing the Profile 
    devise_for :user
  end
  post "payment/index", to: "payment#create", as: "payment"
end
