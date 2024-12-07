Rails.application.routes.draw do
  # Root route
  root to: "pages#home"

  # Static pages
  get "pages/home"
  get "pages/about"

  # Users routes
  devise_for :users

  # Authenticated routes for users
  authenticated :user do
    # Profile routes
    get "profile", to: "users#show", as: :profile
  end

  # Bookings routes
  resources :bookings, only: [ :index ]

  # Rides routes
  resources :rides do
    resources :bookings, only: [ :create ] # Nest bookings under rides
    collection do
      get :search # Route for the search functionality
    end
  end

  # Pages routes
  get "up" => "rails/health#show", as: :rails_health_check
end
