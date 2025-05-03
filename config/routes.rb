Rails.application.routes.draw do
  get "reservations/index"
  root "home#index"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  namespace :admin do
    get "dashboard/index"
    get "dashboard/users"
    get "dashboard/properties"
    get "dashboard/bookings"
    resources :amenities
  end

  resources :reservations, only: [ :index ]
  resources :bookings, only: [ :new, :create, :destroy ]
  resources :rooms
  resources :properties do
    collection do
      get :search
    end
  end

  resources :users, only: [ :show, :edit, :update ] do
    member do
      get :dashboard
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
