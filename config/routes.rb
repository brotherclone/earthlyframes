Rails.application.routes.draw do
  resources :prompts
  resources :logs
  resources :entries
  resources :characters
  resources :character_settings
  resources :character_backgrounds
  resources :character_descriptors
  resources :character_roles
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :streaming_services
  resources :streaming_links
  resources :videos
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
  get 'pulsar', to: 'pulsar#index'
  root 'home#index'

end
