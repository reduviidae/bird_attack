Rails.application.routes.draw do
  resources :attacks, only: [:index, :show, :new, :create, :edit, :update]
  delete '/attacks/:id/delete', to: 'attacks#destroy', as: 'destroy_attack'
  resources :birds, only: [:index, :show, :new, :create, :edit, :update]
  delete '/birds/:id/delete', to: 'birds#destroy', as: 'destroy_bird'
  resources :doctors, only: [:index, :show, :new, :create, :edit, :update]
  delete '/doctors/:id/delete', to: 'doctors#destroy', as: 'destroy_doctor'
  resources :foods, only: [:index, :show, :new, :create, :edit, :update]
  delete '/foods/:id/delete', to: 'foods#destroy', as: 'destroy_food'
  resources :children, only: [:index, :show, :new, :create, :edit, :update]
  delete '/children/:id/delete', to: 'children#destroy', as: 'destroy_children'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'children#home'
  post '/north', to: 'children#north'
  post '/east', to: 'children#east'
  post '/west', to: 'children#west'
  post '/south', to: 'children#south'
  post '/food', to: 'children#food'
  post '/doctor', to: 'children#doctor'
  post '/start_over', to: 'children#start_over'
end
