Rails.application.routes.draw do
  get 'comment/create'
  get 'comment/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "static_pages#index"
end
