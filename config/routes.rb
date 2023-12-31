Rails.application.routes.draw do
  get 'users/index'
  get 'profile', action: :show, controller: 'users'
  resources :users, only: [:index]
  resources :friend_requests, :friends,  only: [:index, :create, :destroy]
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :comments do
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users, :controllers => { :registrations => "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
