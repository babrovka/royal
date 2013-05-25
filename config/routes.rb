Royal::Application.routes.draw do

  get "questions/create"

  resources :orders
  resources :line_items
  resources :carts  
  resources :videos
  resources :events
  resources :products
  resources :articles
  resources :procedures
  
  root :to => 'static_pages#home'
  
  match '/questions' => 'questions#create', :via => :post
  match '/contacts' => 'static_pages#contacts'
  match '/about' => 'static_pages#about'
  match '/account' => 'users#show'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  

end
