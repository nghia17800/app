Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root "static_pages#home"
  get "static_pages/home"
  get "/signup",  to: "users#new"
  resources :users
  resources :posts, only: [:create, :destroy]
  get "static_pages/active", to: "static_pages#active"
end
