Rails.application.routes.draw do
  #get 'images/index'
  #get 'images/create'
  #get 'carts/index'
  #get 'carts/create'
  #get 'order_items/index'
  root 'products#index'
  resources :products
  resources :order_items
  resources :orders
  resources :carts
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

  get 'add_to_cart', action: 'create', controller: 'carts'
  devise_scope :user do
    get 'add_user', to: 'users/registrations#add_user'
  end

end
