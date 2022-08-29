Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: %i[index show]
  resources :carts, only: %i[index create update destroy]
end
