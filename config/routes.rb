# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comment/create'
  get 'comment/delete'
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
  get '/users', to: 'users/registrations#new'
  resources :workshops
  resources :evaluations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end
