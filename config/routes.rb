Shieldformen::Application.routes.draw do
  resources :line_items

  resources :carts

  get "store/index"

  resources :products

  root :to => 'static_pages#home'

  match '/works',       to: 'static_pages#works'
  match '/tips',        to: 'static_pages#tips'
  match '/about',       to: 'static_pages#about'
  match '/store',       to: 'store#index'

  resources :line_items do
    put 'decrement', on: :member
  end
end
