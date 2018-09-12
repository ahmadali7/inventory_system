Rails.application.routes.draw do
  get 'order_items/index'
  root 'products#index'
  resources :products
  resources :order_items
  resources :orders
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }
  get 'add_to_cart', action: 'create', controller: 'order_items'

end
