Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :students, only: [:index]
  resources :students, only: [:show] do
    resources :availabilities, only: [:new, :create, :update, :edit, :destroy]
    resources :preferences, only: [:new, :create, :update, :edit, :destroy]
    resources :referents, only: [:new, :create, :update, :edit, :destroy]
    resources :payments, only: [:new, :create, :update, :edit, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
