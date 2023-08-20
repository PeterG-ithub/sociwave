Rails.application.routes.draw do
  get 'users/index'
  resources :users, only: [:index]
  resources :friend_requests, :friends,  only: [:index, :create, :destroy]
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :comments do
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
