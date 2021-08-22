Rails.application.routes.draw do
  get 'picts/index'
  root to: "picts#index"
end
