Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts
  end

  resources :posts, only: [:index, :show] do
    resource :like, only: [:create, :destroy] # Only one like is allowed per post per user.
  end

  root 'posts#index'
end
