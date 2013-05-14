Royal::Application.routes.draw do

  resources :orders


  resources :line_items
  resources :carts  
  resources :videos
  resources :events
  resources :products
  
  root :to => 'products#index'

  
  match '/account' => 'users#show'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  

end
