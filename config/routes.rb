Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # get '/422', to: 'errors#unprocessable'
  resources :restaurants, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update]
  namespace :owner do
    resources :bookings, only: [:index, :update]
  end
end
