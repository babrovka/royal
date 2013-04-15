Royal::Application.routes.draw do

  match "/videos" => "videos#index"

  root :to => 'pages#home'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
