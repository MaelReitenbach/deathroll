Rails.application.routes.draw do
  devise_for :users
  resources :games
  resources :jointables
  resources :static_pages
  resources :users
  resources :posts
  root 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
