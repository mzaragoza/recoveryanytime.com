RecoveryanytimeCom::Application.routes.draw do


  devise_for :admins, :controllers => {
    registrations: 'admins/registrations',
    :sessions => "admins/sessions",
    :passwords => 'admins/passwords',
    :confirmations => 'admins/confirmations'
  }

  authenticate :admin do
    namespace :admins do
      resources :profile, :only => [:edit, :update]
      resources :admins
      match "/users/:id/banned" => "users#banned", :as => :users_banned, via: :all
      resources :users
      resources :email_campaings
      root 'dashboard#index'
    end
  end

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => "users/sessions",
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }

  authenticate :user do
    namespace :users do
      #match '/users/registrations' => 'users#registrations',   as: :registrations, via: :post
      resources :profile
      resources :email_campaing_users
      root 'dashboard#index'
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
