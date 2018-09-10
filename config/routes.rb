Rails.application.routes.draw do
  get 'order_items/index'
  root 'products#index'
  resources :products
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  get 'add_to_cart', action: 'create', controller: 'order_items'

  
end
