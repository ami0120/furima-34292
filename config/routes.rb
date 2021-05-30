Rails.application.routes.draw do
  get 'shoppings/index'
  root to: 'items#index'
  devise_for :users
  resources :items
end
