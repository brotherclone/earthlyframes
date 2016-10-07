Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :shows
  resources :posts
  resources :albums
  get 'soon', to:'soon#index'
  get 'home', to:'home#index'
  get 'about', to:'about#index'
  get 'eula', to:'eula#index'
  get 'ytr', to:'your_team_ring_archive#index'
  get 'yourteamring', to:'your_team_ring_archive#index'
  get 'your-team-ring', to:'your_team_ring_archive#index'

  if Rails.env.production?
    root 'soon#index'
  else
    root 'home#index'
  end

end
