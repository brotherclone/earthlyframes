Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :shows

  resources :posts

  resources :songs

  resources :releases

  resources :albums

  get 'soon', to:'soon#index'
  get 'home', to:'home#index'

  get 'offer_releases', to: 'releases#offer'
  get 'offer_shows', to: 'shows#offer'
  get 'offer_posts', to: 'posts#offer'

  root 'home#index'
end
