RecoveryanytimeCom::Application.routes.draw do


  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => "users/sessions",
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }

  authenticate :user do
    namespace :users do
      match '/users/registrations' => 'users#registrations',   as: :registrations, via: :post
    end
  end

  resources :directorys
  resources :contacts
  resources :blogs
  resources :meetings
  match 'privacy_policy' => 'pages#privacy_policy',   as: :privacy_policy, via: :all
  match 'get_help_now' => 'pages#get_help_now',   as: :get_help_now, via: :all
  match 'about_us'     => 'pages#about_us',       as: :about_us, via: :all
  match 'ping'         => 'pages#ping',           as: :ping, via: :all
  root 'pages#index'
end
