Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'employees/', to: "employees#index"
  get 'employees/index'
  get 'employees/new'
  get 'employees/update/:id', to: "employees#update"
  get 'employees/destroy'
  get 'employees/:id', to: "employees#show"
  post 'employees/', to: "employees#create"

  get 'teams/', to: "teams#index"
  get 'teams/index'
  get 'teams/new'
  get 'teams/update/:id', to: "teams#update"
  get 'teams/destroy'
  get 'teams/:id', to: "teams#show"
  post 'teams/', to: "teams#create"

  get 'search', to: 'search#search'

  # Defines the root path route ("/")
  root "teams#index"

  resources :teams do
    resources :employees
  end
  resources :employees do
    resources :teams
  end
end
