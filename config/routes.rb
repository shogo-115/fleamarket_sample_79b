Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'names', to: 'users/registrations#new_names'
    post 'names', to: 'users/registrations#create_names'
    get 'edit_names', to: 'users/registrations#edit_names'
    patch 'update_names', to: 'users/registrations#update_names'
    get 'edit_address', to: 'users/registrations#edit_address'
    patch 'update_address', to: 'users/registrations#update_address'
  end
  root 'products#index'
  resources :products, expect: :show
  resources :buys, only: :new
  resources :users, only: :show
  get 'after_logout', to: 'users#logout'
  delete 'user_delete', to: 'users#delete'
end