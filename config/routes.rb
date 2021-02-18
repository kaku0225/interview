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
    get '/my_cart', action: 'show'
    post '/add_to_cart', action: 'create'
  end

  resource :favorites, controller: 'favorites', only: [] do
    get '/my_fav_products', action: 'show'
    post '/add_fav_products', action: 'create'
  end

  resource :orders, controller: 'orders', only:[] do
    get '/my_orders', action: 'index'
    get '/my_order_detail', action: 'show'
    post '/create_order', action: 'create'
  end
  
end
