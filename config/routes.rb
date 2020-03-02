Rails.application.routes.draw do
  get 'notifications/new'
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  #get '/help', to: "static_pages#help"
  get "/about", to: "static_pages#about"
  # For details on the DSL av ailable within this file, see http://guides.rubyonrails.org/routing.html
  get "/signup", to: "users#new"
  post '/signup',  to: 'users#create'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/notifications", to: "notifications#new"
  get "/notifications/index", to: "notifications#index"
  get "notifications/:id/destroy", to: "notifications#destroy"
  post "/notifications", to: "notifications#create"
  delete "/notifications", to:"notifications#destroy"
  resources :users
end
