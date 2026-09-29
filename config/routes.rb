Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The public site is read-only. All content editing happens in ActiveAdmin
  # (/admin, behind Devise), so these resources only expose index/show.
  resources :constellations, only: %i[index show] do
    resources :song_constellations, only: %i[index show]
  end
  resources :streaming_services, only: %i[index show]
  resources :posts, only: %i[index show]
  resources :music_formats, only: %i[index show]
  resources :albums, only: %i[index show] do
    resources :release_formats, only: %i[index show]
    resources :album_streaming_links, only: %i[index show]
    resources :songs, only: %i[index show] do
      resources :streaming_links, only: %i[index show]
      resources :embeds, only: %i[index show]
    end
  end
  get 'about', to: 'about#index'
  get 'eula', to: 'eula#index'
  get 'songs/just-titles', to:'songs#just_titles'

  root 'home#index'
end
