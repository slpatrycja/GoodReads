Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :books
  resources :reviews, only: [:index, :create]
  resources :ratings, only: [:index, :create]
  get '/top_ten', to: 'books#top_books'
end
