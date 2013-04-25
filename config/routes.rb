Royal::Application.routes.draw do

  get "users/show"

  match "/videos" => "videos#index"
  
  match 'users/:id' => 'users#show'
  
  resources :events

  root :to => 'pages#home'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
