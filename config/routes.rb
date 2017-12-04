Rails.application.routes.draw do
  root 'static_pages#index'

  get '/index', to: 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/featured', to: 'static_pages#featured'
  resources :products
  # get '/products/:id', to: 'products#show'
  resources :orders, only: [:index, :show, :create, :destroy]
  # resources :orders, except: [:new, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
