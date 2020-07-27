Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'names', to: 'users/registrations#new_names'
    post 'names', to: 'users/registrations#create_names'
  end
  root 'toppages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
