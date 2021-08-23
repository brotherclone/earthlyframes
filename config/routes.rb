Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :songs
  resources :prompts
  resources :logs
  resources :entries
  resources :characters
  resources :character_settings
  resources :character_backgrounds
  resources :character_descriptors
  resources :character_roles
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
  get 'pulsar', to: 'pulsar#index'
  get 'pulsar/character-creation', to:'pulsar#create_character'
  get 'pulsar/entry', to:'pulsar#create_entry'
  get 'pulsar/share', to: 'pulsar#send_log'
  get 'pulsar/so-long', to:'pulsar#so_long'
  get 'rainbow', to: 'rainbow_table#index'
  root 'home#index'

end
