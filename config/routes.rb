Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items do
    resources :shoppings, only: [:index,:create]
  end
    
end
