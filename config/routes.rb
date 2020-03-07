Rails.application.routes.draw do
  get 'notifications/new'
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  get '/howto', to: "static_pages#howto"
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
  get "notifications/:id/edit", to: "notifications#edit"
  get "/notifications/admin", to: "notifications#admin"
  post "/notifications", to: "notifications#create"
  post "/notifications/:id/update", to: "notifications#update"
  delete "/notifications", to:"notifications#destroy"
  resources :users
end
