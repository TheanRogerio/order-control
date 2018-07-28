Rails.application.routes.draw do
  get 'order_items/index'
  root to: "users#index"
  resources :users
  resources :orders

  resources :orders do
    resources :order_items
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
