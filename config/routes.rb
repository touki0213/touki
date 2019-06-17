
Rails.application.routes.draw do
  get 'sessions/new'
  get 'user/show'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  
  resources :users
  # get "/users" => "users#index"
  # get "/users/:id" => "users#show"
  # get "/users/new" => "users#new"
  # post "/users" => "users#create"
  # get "/users/:id/edit" => "users#edit"
  # patch "/users/:id" => "users#update"
  # delete "/users/:id" => "users#delete"
 end
