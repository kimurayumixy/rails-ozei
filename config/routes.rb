Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :restaurants, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update]
  namespace :owner do
    resources :bookings, only: [:index, :update]
  end
end
