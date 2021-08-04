Rails.application.routes.draw do
  root to: 'home#index'
  get "home/:id", to: "home#show", as: "show"
  devise_scope :user do
    get "/login", :to => "devise/sessions#new" # Add a custom sign in route for user sign in
    delete "/logout", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign out
    get "/sign_up", :to => "devise/registrations#new" # Add a Custom Route for Registrations
    devise_for :user
  end
  resources :profiles
  resources :food_items
  resources :line_items
  resources :carts
  resources :reviews
  post "payment/index", to: "payment#create", as: "payment"
end
