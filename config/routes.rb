Rails.application.routes.draw do
  get 'crestron/index'
  devise_for :users
  root "static_pages#index"
  resources :static_pages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end