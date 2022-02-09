Rails.application.routes.draw do
  devise_for :users
  get 'items', to: 'items#index'
  root to: 'items#index'
  resources :items, only: [:new, :index, :create, :show, :edit, :update]
  post 'items/new', to: 'items#new'
  resources :users, only: [:show]
end
