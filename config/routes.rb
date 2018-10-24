Rails.application.routes.draw do
  get 'comment/create'
  get 'comment/delete'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/users', to: 'users/registrations#new'
  get '/workshops', to: 'workshops#index', as: 'workshops'
  get '/workshops/new', to: 'workshops#new', as: 'new_workshop'
  post '/workshops', to: 'workshops#create'
  get '/workshops/:id', to: 'workshops#show', as: 'workshop'
  get '/workshops/:id/edit', to: 'workshops#edit', as: 'edit_workshop'
  patch '/workshops/:id', to: 'workshops#update', as: 'update_workshop'
  delete '/workshops/:id', to: 'workshops#destroy', as: 'destroy_workshop'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
end
