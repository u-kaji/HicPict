Rails.application.routes.draw do
  devise_for :users
  get 'picts/index'
  root to: "picts#index"
  resources :users, only: [:edit, :update, :destroy]
  resources :picts
end
