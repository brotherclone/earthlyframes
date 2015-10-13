Rails.application.routes.draw do
  resources :shows

  resources :posts

  resources :songs

  resources :releases

  resources :albums

  get 'soon', to:'soon#index'
  get 'home', to:'home#index'

  root 'home#index'
end
