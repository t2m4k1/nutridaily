Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :users
  resources :ingredients
  resources :recipes
  resources :subscriptions
  get    '/login',   to: 'sessions#new'
  get    '/licenses',   to: 'licenses#index'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #get    '/logout',   to: 'sessions#destroy'
  #delete '/logout_all',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
