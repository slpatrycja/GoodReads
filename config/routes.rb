Rails.application.routes.draw do
  root 'welcome#index'

  resources :books
  resources :reviews, only: [:index, :create]
  resources :ratings, only: [:index, :create]
end
