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
  resources :products
  resources :buys, only: :new
  resources :users, only: :show
  get 'after_logout', to: 'users#logout'
  delete 'user_delete', to: 'users#delete'
  get 'proDlt', to: 'products#proDlt'
  resources :products do
    resources :comments, only: :create
    resources :favorites , only: [:index, :create, :destroy]
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  delete 'deleteData', to: 'card#deleteData'
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  get 'newlook', to: 'newlooks#index'
  resources :searches, only: :index
  get 'women', to: 'womens#index'
  get 'men', to: 'mens#index'
  get 'camera', to: 'cameras#index'
  get 'hobby', to: 'hobbies#index'
end