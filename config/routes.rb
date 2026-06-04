Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
      resources :embeds
    end
  end
  get 'about', to: 'about#index'
  get 'eula', to: 'eula#index'
  get 'songs/just-titles', to:'songs#just_titles'

  root 'home#index'
end
