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

  if Rails.env.development?
    root 'soon#index'
  else
    root 'home#index'
  end

end
