Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :teachers, only: [:index]
  resources :courses #do resources :bookings....
end
