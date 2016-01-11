Rails.application.routes.draw do

  mount Kss::Engine => '/kss' if Rails.env.development?

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :shows
  resources :posts
  resources :albums
  get 'soon', to:'soon#index'
  get 'home', to:'home#index'
  get 'about', to:'about#index'
  get 'eula', to:'eula#index'
  get 'privacy', to:'privacy#index'
  root 'home#index'
end
