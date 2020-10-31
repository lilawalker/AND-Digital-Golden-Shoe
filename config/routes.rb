Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  resources :products, only: [:index, :show]

  post '/baskets/add', to: 'basket_items#create', as: 'add_to_basket'

  root to: 'home#index'
end
