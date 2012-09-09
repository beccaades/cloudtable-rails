CloudtableRails::Application.routes.draw do
  resources :tables do
    collection :from_token
  end
  resources :restaurants

  root :to => "restaurants#new"
end
