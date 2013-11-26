Todolist::Application.routes.draw do

  resources :tasks
  root 'tasks#index'
  patch "/close_task/:id" => 'tasks#close_task',  as: 'close_task'
  patch "/open_task/:id"  => 'tasks#open_task',   as: 'open_task'

end
