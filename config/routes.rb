Rails.application.routes.draw do
  devise_for :users
  get 'picts/index'
  root to: "picts#index"
  resources   :users, only: [:edit, :update, :destroy]
  resources   :picts do
    resources :hics, only: [:new, :create] do
      resources :eval, only: [:new]
    end
  end
end
