Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  resources :products, only: [:index, :show]

  root to: "home#index"
end
