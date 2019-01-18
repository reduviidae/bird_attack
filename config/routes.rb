Rails.application.routes.draw do
  resources :attacks
  resources :birds
  resources :doctors
  resources :foods
  resources :children
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
