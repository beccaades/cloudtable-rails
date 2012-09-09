CloudtableRails::Application.routes.draw do
  resources :tables
  resources :restaurants

  root :to => "restaurants#new"
end
