Rails.application.routes.draw do
  get 'cart/show'
  root 'welcome#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session/', to: 'sessions#destroy'
  
  get 'tags/:tag', to: 'products#index', as: :tag
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'lineitems/:id/add' => "lineitems#add_quantity", as: "lineitem_add"
  post 'lineitems/:id/reduce' => "lineitems#reduce_quantity", as: "lineitem_reduce"
  post 'lineitems' => "lineitems#create"
  get 'lineitems/:id' => "lineitems#show", as: "lineitem"
  delete 'lineitems/:id' => "lineitems#destroy"

  scope '/greater_or_equal_to_100_total' do
    resources :orders 
  end

  resources :categories_tags
  resources :products_tags
  resources :departments do
    resources :categories
  end

  resources :categories do
    resources :tags
  end

  resources :tags do
    resources :products
    resources :categories
  end

  resources :products do
    resources :lineitems
    resources :orders
    resources :questions
    resources :reviews
    resources :tags
  end

  resources :orders do
    resources :lineitems
    resources :products
  end

  resources :lineitems

  resources :questions do
    resources :answers
  end

  resources :answers
  resources :reviews

  resources :users do
    resources :products
    resources :orders
    resources :questions
    resources :answers
    resources :reviews
  end
end
