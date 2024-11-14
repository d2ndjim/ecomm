Rails.application.routes.draw do
  namespace :admin do
    resources :stocks
    resources :products
    resources :categories
  end
  
  get 'admin/index'
  devise_for :admins

  root "home#index"

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  get "admin" => "admin#index"
end
