Royal::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  get "search/search"

  get "media/index"

  get "questions/create"

  resources :orders
  resources :line_items
  match "/increase/:id" => "line_items#increase", :as => :increase
  match "/decrease/:id" => "line_items#decrease", :as => :decrease
  resources :carts  
  resources :videos
  resources :events
  resources :products
  match 'products/select' => 'products#select', :via => :post
  resources :articles
  resources :procedures
  
  root :to => 'static_pages#home'
  
  match '/search', to: 'search#search'
  match "/albums/:id" => "media#album", :as => :album
  match '/publications' => 'publications#index'
  match '/news' => 'articles#index'
  match '/consultations' => 'consultations#index'
  match '/media' => 'media#index'
  match '/questions' => 'questions#create', :via => :post
  match '/contacts' => 'static_pages#contacts'
  match '/about' => 'static_pages#about'
  match '/account' => 'users#show'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  

end
