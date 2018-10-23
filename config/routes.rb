Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/workshops', to: 'workshops#index', as: 'workshops'
  get '/workshops/new', to: 'workshops#new', as: 'new_workshop'
  post '/workshops', to: 'workshops#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
end
