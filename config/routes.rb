Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :links
  resources :photos

  root :to => "home#index"

  get "submit" => "posts#new"
  get "about" => "about#index"
  get "bio" => "bio#index"
end
