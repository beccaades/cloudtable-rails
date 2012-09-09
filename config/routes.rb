CloudtableRails::Application.routes.draw do
  resources :tables do
    get :from_token, :on => :collection
  end
  resources :restaurants
  resources :orders do
    resources :order_items
  end
  resources :menu_items

  root :to => "restaurants#index"
end
