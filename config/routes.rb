CloudtableRails::Application.routes.draw do
  resources :tables do
    get :from_token, :on => :collection
  end
  resources :restaurants

  root :to => "restaurants#index"
end
