Rails.application.routes.draw do
  # get 'images/index'
  # get 'images/create'
  # get 'carts/index'
  # get 'carts/create'
  # get 'order_items/index'
  root 'products#index'
  resources :products do
    resources :comments
  end
  resources :order_items
  resources :orders
  resources :carts
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

  post 'add_to_cart', action: 'create', controller: 'carts'
  # devise_scope :user do
  #   get 'add_user', :action => 'add_user', :controller => 'users/registrations', :as => 'add_user'
  # end

  devise_scope :user do
    get 'add_user', to: 'users/registrations#add_user'
    post 'create_user', to: 'users/registrations#create_user'
  end
  mount ActionCable.server => '/cable'
end
