Rails.application.routes.draw do
  # get 'sessions/new' => 'sessions#new'
  # post 'sessions/new' => 'sessions#create'

  resources :users
  resources :sessions
  resources :secrets
  resources :likes
  
  root 'sessions#new'
end
