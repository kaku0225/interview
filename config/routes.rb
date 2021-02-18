Rails.application.routes.draw do
  root 'homes#index'

  resource :users, controller: 'registrations', only: [:create, :edit, :update] do
    get '/sign_up', action: 'new'
  end

  resource :users, controller: 'sessions', only: [] do
    get '/sign_in', action: 'new'
    post '/sign_in', action: 'create'
    delete '/sign_out', action: 'destroy'
  end

  resource :carts, controller: 'carts', only: [] do
    get '/my_cart', action: 'my_cart'
    post '/add_to_cart', action: 'add_to_cart'
  end

  resource :favorites, controller: 'favorites', only: [] do
    get '/my_fav_products', action: 'my_fav_products'
    post '/add_fav_products', action: 'add_fav_products'
  end

  resource :orders, controller: 'orders', only:[] do
    get '/my_orders', action: 'my_orders'
    get '/my_order_detail', action: 'my_order_detail'
    post '/create_order', action: 'create_order'
  end
  
end
