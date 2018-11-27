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
    resources :backgrounds
    resources :categories
    resources :contacts
    get '/home', to: 'admin_dashboard#home'
    get '/users', to: 'admin_dashboard#users'
    delete '/users', to: 'admin_dashboard#delete_user'
    get '/edit_user/:id', to: 'admin_dashboard#edit_user', as: 'edit_user'
    patch '/edit_user/:id', to: 'admin_dashboard#update_user', as: 'update_user'
    get '/videos', to: 'admin_dashboard#videos_index', as: 'videos'
    get '/post_video', to: 'admin_dashboard#new_video', as: 'post_video'
    post '/post_video', to: 'admin_dashboard#create_video'
    get '/edit_video/:id', to: 'admin_dashboard#edit_video', as: 'edit_video'
    patch '/edit_video/:id', to: 'admin_dashboard#update_video'
    delete '/delete_video', to: 'admin_dashboard#delete_video', as: 'delete_video'
  end

  scope path: 'supervisorDashboard', as: 'supervisorDashboard' do
    get 'home', to: 'supervisor_dashboard#home'
    get 'unvalidated_workshops', to: 'supervisor_dashboard#show_unvalidated_workshops'
    get 'write_feedback', to: 'feedbacks#new'
    post 'feedback', to: 'feedbacks#create'
    put 'accept_workshop', to: 'supervisor_dashboard#accept_workshop'
    put 'reject_workshop', to: 'supervisor_dashboard#reject_workshop'
  end

  get '/users', to: 'users/registrations#new'
  get '/videos', to: 'users#videos_index'
  get '/my_profile', to: 'users#profile', as: "profile"
  get '/my_profile/user_workshops', to: 'users#user_workshops', as: "user_workshops"
  get '/my_profile/user_workshop/feedback', to: 'feedbacks#show', as: "rejected_workshop_feedback"

  resources :workshops
  resources :evaluations
  resources :comment

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#home'

end
