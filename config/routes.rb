Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :teachers, only: [:index, :show]
  resources :courses do
    resources :bookings, only: [:create, :destroy]
   #do resources :bookings....
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show]
end
