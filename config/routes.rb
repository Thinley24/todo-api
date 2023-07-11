Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" 

  post '/signup', to: 'users#create'
  # post '/auth/login', to: 'sessions#create'
  post 'auth/login', to: 'authentication#authenticate'
  get '/auth/logout', to: 'authentication#destroy'
  get '/tasks', to: 'tasks#index'
  post '/tasks', to: 'tasks#create'
  get '/tasks/:id', to: 'tasks#show'
  put '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy'
  get '/auth/profile', to: 'user_profiles#show'
  put '/auth/profile', to: 'user_profiles#update'

  resources :users do
    resources :tasks, only: [:create]
  end
end
