Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users
  root to: "homes#top"
  resources :users, only: [:show, :edit]
  get 'homes/about'
end
