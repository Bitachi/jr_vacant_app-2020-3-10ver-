Rails.application.routes.draw do
  root "static_pages#home"
  get 'static_pages/home'
  get 'static_pages/help'
  get "static_pages/about"
  # For details on the DSL av ailable within this file, see http://guides.rubyonrails.org/routing.html
end
