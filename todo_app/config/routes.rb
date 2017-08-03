Rails.application.routes.draw do
  get 'todos', to: 'todos#index'
  get 'todos/new'
  get 'todos/list'
  post 'todos', to: 'todos#create'
  get 'todos/:id/edit', to: 'todos#edit', as: 'update'
  patch 'todos/:id', to: 'todos#update'
  delete 'todos/:id', to: 'todos#destroy'
  get 'todos/:id', to: 'todos#show', as: 'todo'

  put 'todos/:id', to: 'todos#complete', as: 'complete'

  root 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
