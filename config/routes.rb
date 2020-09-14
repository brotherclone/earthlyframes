Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    post 'api/user/create', to:'users#new'
    post 'api/user/sign-in', to:'devise/sessions#new'
  end
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
  get 'soon', to:'soon#index'
  get 'home', to:'home#index'
  get 'about', to:'about#index'
  get 'eula', to:'eula#index'
  get 'ytr', to:'your_team_ring_archive#index'
  get 'yourteamring', to:'your_team_ring_archive#index'
  get 'your-team-ring', to:'your_team_ring_archive#index'

  #post 'api/user/create', to:'users#create'
  #post 'api/user/sign-in', to:'devise/sessions#new'

  get 'api/user/:id/characters', to: 'users#characters'
  get 'api/get-user-by-email', to:'users#by_email'
  put 'api/user/:id', to:'users#update'
  get 'api/user/:id', to:'users#show'
  post 'api/entry/create', to:'entries#create'
  get 'api/entry/:id', to:'entries#show'
  put 'api/entry/:id', to:'entries#update'
  delete 'api/entry/:id', to:'entries#destroy'
  get 'api/player-character-info', to:'player_characters#index'
  get 'api/characters/:id', to:'characters#show'
  post 'api/characters/create', to:'characters#create'
  put 'api/characters/:id', to:'characters#update'
  delete 'api/characters/:id', to:'characters#update'

  get 'api/prompts/', to:'prompts#get_from_last_entry'
  get 'api/logs/:id/invite', to: 'logs#invite_by_email'
  get 'api/logs/:id', to:'logs#show'
  post 'api/logs/create', to:'logs#create'


  root 'home#index'

end
