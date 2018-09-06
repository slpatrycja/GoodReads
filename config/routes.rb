Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :books do
    resources :reviews, only: [:index, :create, :destroy]
    resources :ratings, only: [:index, :create]
  end
  get '/top_ten', to: 'books#top_books'
end
