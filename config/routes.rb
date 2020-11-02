Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: {session: :sessions }, path_names: {sign_in: :login}
    resource :users, only: [:show, :update, :characters, :destroy]
  end

  resources :songs
  resources :tags
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
  resources :consequences

  get 'soon', to:'soon#index'
  get 'home', to:'home#index'
  get 'about', to:'about#index'
  get 'eula', to:'eula#index'
  get 'ytr', to:'your_team_ring_archive#index'
  get 'yourteamring', to:'your_team_ring_archive#index'
  get 'your-team-ring', to:'your_team_ring_archive#index'
  post 'api/users/create', to:'users#create'
  get 'api/users/:id/characters', to: 'users#characters'
  get 'api/get-user-by-email', to:'users#by_email'
  put 'api/users/:id', to:'users#update'
  get 'api/users/:id', to:'users#show'
  post 'api/entries/create', to:'entries#create'
  get 'api/entries/:id', to:'entries#show'
  put 'api/entries/:id', to:'entries#update'
  delete 'api/entries/:id', to:'entries#destroy'
  get 'api/entries-for-character', to:'entries#by_character'
  get 'api/player-character-info', to:'player_characters#index'
  get 'api/characters/:id', to:'characters#show'
  post 'api/characters/create', to:'characters#create'
  put 'api/characters/:id', to:'characters#update'
  delete 'api/characters/:id', to:'characters#update'
  post 'api/characters/:id/archive', to:'characters#archive'
  get 'api/prompts/', to:'prompts#get_from_last_entry'
  get 'api/logs/:id/invite', to: 'logs#invite_by_email'
  get 'api/logs/:id', to:'logs#show'
  post 'api/logs/create', to:'logs#create'
  post 'api/consequences', to: 'consequences#reveal'
  root 'home#index'

end
