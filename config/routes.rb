Rails.application.routes.draw do
  root 'welcome#index'

  resources 'books'
  resources 'reviews'
  resources 'ratings'
end
