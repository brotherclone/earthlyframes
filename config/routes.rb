Rails.application.routes.draw do
  resources :albumtypes

  resources :albumformats

  resources :images

  resources :shows

  resources :posts

  resources :albums

  resources :songs

  get 'soon', to:'comingsoon#index'
  get 'home', to:'home#index'

  if Rails.env.production?
    root 'comingsoon#index'
  else
    root 'home#index'
  end

end
