Rails.application.routes.draw do
  get "/my_products", to: "products#my_products", as: :my_products
  get "/my_sales", to: "products#my_sales", as: :my_sales
  get '/orders', to: 'orders#index', as: :orders
  devise_for :users
  root to: 'products#index'

  resources :products do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:edit, :show, :update, :destroy] do
    resources :reviews, only: [:new, :create]
    resources :payments, only: :new
  end
  resources :reviews, only: [:destroy]
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
