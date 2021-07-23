Rails.application.routes.draw do
  resources :food_items
  resources :profiles
  # devise_for :users
  root to: 'home#index'
  devise_scope :user do
    get "/login", :to => "devise/sessions#new" # Add a custom sign in route for user sign in
    delete "/logout", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign out
    get "/sign_up", :to => "devise/registrations#new" # Add a Custom Route for Registrations
    get "/profile", :to => "devise/registrations#edit"
    devise_for :user
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
