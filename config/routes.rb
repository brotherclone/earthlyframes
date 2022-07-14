Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :embeds
  resources :constellations do
    resources :song_constellations
  end
  resources :streaming_services
  resources :posts
  resources :music_formats
  resources :albums do
    resources :release_formats
    resources :album_streaming_links
    resources :songs do
      resources :streaming_links
      resources :videos
    end
  end
  get 'about', to: 'about#index'
  get 'eula', to: 'eula#index'
  get 'your-team-ring', to: 'your_team_ring#index'
  root 'home#index'
end
