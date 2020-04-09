Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :teachers, only: [:index, :new, :create, :update, :edit, :destroy]
  resources :lessons do
    resources :students, only: [ :new, :create]
    resources :student_lessons
  end
  resources :students, only: [:index, :show, :edit, :update, :destroy] do
    resources :availabilities, only: [:new, :create, :update, :edit, :destroy]
    resources :preferences, only: [:new, :create, :update, :edit, :destroy]
    resources :referents, only: [:new, :create, :update, :edit, :destroy]
    resources :payments, only: [:new, :create, :update, :edit, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
