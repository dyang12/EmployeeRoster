EmployeeRoster::Application.routes.draw do
  resources :employees
  resources :sessions, :only => [:new, :create, :destroy]
  root :to => "sessions#new"
end
