CloudtableRails::Application.routes.draw do
  resources :restaurants

  root :to => "restaurants#new"
end
