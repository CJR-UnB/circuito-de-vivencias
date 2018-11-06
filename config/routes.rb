# frozen_string_literal: true

Rails.application.routes.draw do
  post 'comment/create'
  delete 'comment/delete'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users', to: 'users/registrations#new'
  end
  scope path: 'adminDashboard', as: 'adminDashboard' do
    get '/home', to: 'admin_dashboard#home'
  end
  scope path: 'supervisorDashboard', as: 'supervisorDashboard' do
    get 'home', to: 'supervisor_dashboard#home'
    get 'unvalidated_workshops', to: 'supervisor_dashboard#show_unvalidated_workshops'
    put 'accept_workshop', to: 'supervisor_dashboard#accept_workshop'
    put 'reject_workshop', to: 'supervisor_dashboard#reject_workshop'
  end
  get '/users', to: 'users/registrations#new'
  resources :workshops
  resources :evaluations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end
