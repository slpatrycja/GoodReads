Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :welcome
  resources :books do
    resources :reviews, only: [:index, :create]
    resources :ratings, only: [:index, :create]
  end
  get '/top_ten', to: 'books#top_books'
end
