CloudtableRails::Application.routes.draw do
  resources :tables do
    get :from_token, :on => :collection
  end
  resources :restaurants
  resources :orders do
    resources :order_items
  end
  resources :menu_items
  resources :ratings do
    get :from_menu_item, :on => :collection
  end

  root :to => "restaurants#index"
end
