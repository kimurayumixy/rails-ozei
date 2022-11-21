Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :restaurants, only: [:index, :show]
  resources :bookings, only: [:index, :create, :update]
  namespace :owner do
    resources :bookings, only: [:index, :update]
  end
end
