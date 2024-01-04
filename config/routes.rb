Rails.application.routes.draw do
  devise_for :users
  resources :books
  root to: "homes#top"
  resources :users
  get 'homes/about'
end
