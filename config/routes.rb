# frozen_string_literal: true

Rails.application.routes.draw do
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
    get '/users', to: 'admin_dashboard#users'
    delete '/users', to: 'admin_dashboard#delete_user'
    get '/edit_user/:id', to: 'admin_dashboard#edit_user', as: 'edit_user'
    patch '/edit_user/:id', to: 'admin_dashboard#update_user', as: 'update_user'
  end
  get '/users', to: 'users/registrations#new'
  resources :workshops
  resources :evaluations
  resources :comment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end
