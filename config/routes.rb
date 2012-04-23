Shieldformen::Application.routes.draw do
    
  
  resources :discounts

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :orders

  resources :line_items

  resources :carts

  resources :sizes

  get 'confirmation' => 'confirmation#index'

  get "store/index"

  resources :products do
    get :who_bought, on: :member
  end

  root :to => 'static_pages#home'

  match '/works',             to: 'static_pages#works'
  match '/tips',              to: 'static_pages#tips'
  match '/tips/benefits',     to: 'static_pages#benefits'
  match '/tips/moisturizers', to: 'static_pages#moisturizers'
  match '/tips/cleansers',    to: 'static_pages#cleansers'
  match '/about',             to: 'static_pages#about'
  match '/about/values',      to: 'static_pages#values'
  match '/about/natural',     to: 'static_pages#natural'
  match '/about/ingredients', to: 'static_pages#ingredients'
  match '/about/team',        to: 'static_pages#team'
  match '/about/jobs',        to: 'static_pages#jobs'
  match '/store',             to: 'store#index'
  match '/privacy',           to: 'static_pages#privacy'
  match '/shipping',          to: 'static_pages#shipping'
  match '/ccv2',              to: 'static_pages#ccv2'

  resources :line_items do
    post 'decrement', on: :member
    post 'increment', on: :member
  end

  
end
