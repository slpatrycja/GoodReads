Rails.application.routes.draw do
  root 'welcome#index'

  get 'books/sort_asc', to: 'books#sort_asc'
  get 'books/sort_desc', to: 'books#sort_desc'
  resources 'books'
  resources 'reviews'
  resources 'ratings'
end
