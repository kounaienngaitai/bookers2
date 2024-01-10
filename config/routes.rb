Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update]
  get 'home/about', to: 'homes#about'
end
