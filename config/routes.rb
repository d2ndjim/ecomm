Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :stocks
    resources :products
    resources :categories
  end
  
  devise_for :admins

  root "home#index"

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  resources :categories, only: [:show]
  resources :products, only: [:show]


  get "admin" => "admin#index"
end
