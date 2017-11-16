Rails.application.routes.draw do
  get '/index', to: 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/product', to: 'static_pages#product'
  root 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
