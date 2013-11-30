Todolist::Application.routes.draw do

  root 'tasks#index'

  resources :users
    get "/users/new" => 'users#new', as: 'sign_up'
  resources :tasks
    patch "/close_task/:id" => 'tasks#close_task',  as: 'close_task'
    patch "/open_task/:id"  => 'tasks#open_task',   as: 'open_task'

end
