Todolist::Application.routes.draw do

  root 'tasks#index'

  resources :tasks
  patch   "close_task/:id" => 'tasks#close_task'  , as: 'close_task'
  patch   "open_task/:id"  => 'tasks#open_task'   , as: 'open_task'

  resources :users
  get     "signup"          => 'users#new'         , as: 'signup'

  resources :sessions
  get     "signin"          => 'sessions#new'   , as: 'signin'
  get     "signout"         => 'sessions#destroy'  , as: 'signout'

end
