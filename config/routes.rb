Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  resources :products, only: [:index, :show]

  get '/basket', to: 'baskets#show', as: 'basket'
  post '/baskets/add', to: 'basket_items#create', as: 'add_to_basket'
  delete '/baskets/remove', to: 'basket_items#destroy', as: 'remove_from_basket'

  post '/checkout', to: 'orders#create', as: 'checkout'
  get '/order/:id', to: 'orders#show', as: 'order'

  root to: 'home#index'
end
