RecoveryanytimeCom::Application.routes.draw do

  resources :directorys
  resources :contacts
  resources :blogs
  resources :meetings
  match 'get_help_now' => 'pages#get_help_now',   as: :get_help_now, via: :all
  match 'about_us'     => 'pages#about_us',       as: :about_us, via: :all
  match 'ping'         => 'pages#ping',           as: :ping, via: :all
  root 'pages#index'
end
