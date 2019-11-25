Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: "pages#dashboard"
  root to: 'spaceships#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :spaceships do
    resources :bookings
  end
    namespace :admin do
    resources :spaceships, only: [:index] do
      resources :bookings, only: [:index]
    end
  end
end
