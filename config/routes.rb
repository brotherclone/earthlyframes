Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :songs
  resources :prompts
  resources :logs
  resources :streaming_services
  resources :streaming_links
  resources :videos
  resources :shows
  resources :posts
  resources :albums
  get 'player-characters', to:'player_characters#index'
  get 'soon', to:'soon#index'
  get 'home', to:'home#index'
  get 'about', to:'about#index'
  get 'eula', to:'eula#index'
  get 'ytr', to:'your_team_ring_archive#index'
  get 'yourteamring', to:'your_team_ring_archive#index'
  get 'your-team-ring', to:'your_team_ring_archive#index'
  get 'rainbow', to: 'rainbow_table#index'
  root 'home#index'

end
