Rails.application.routes.draw do
  devise_for :users
  get 'picts/index'
  root to: "picts#index"
  
  resources   :users, only: [:edit, :update, :destroy, :show]
  resources   :picts do
    resources :likes, only: [:create, :destroy]
    resources :hics, only: [:new, :create] do
      resources :evals, only: [:new, :create, :show]
    end
  end
end
