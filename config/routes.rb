Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :teachers, only: [:index, :show]
  resources :courses do
    resources :bookings, only: [:new, :create, :show, :destroy] do
          resources :payments, only: :new
    end
  end

   #do resources :bookings....
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show]
end
