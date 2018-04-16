Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :users
  resources :ingredients
  resources :recipes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post   '/subscriptions/create',   to: 'subscriptions#create'
  #get    '/logout',   to: 'sessions#destroy'
  #delete '/logout_all',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
