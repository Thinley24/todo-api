Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/signup', to: 'users#create'
  post '/auth/login', to: 'sessions#create'
  get '/auth/logout', to: 'sessions#destroy'
  get '/todos', to: 'tasks#index'
  post '/todos', to: 'tasks#create'
  get '/todos/:id', to: 'tasks#show'
  put '/todos/:id', to: 'tasks#update'
  delete '/todos/:id', to: 'tasks#destroy'
  post '/auth/profile', to: 'user_profiles#create'
  get '/auth/profile', to: 'user_profiles#show'
  put '/auth/profile', to: 'user_profiles#update'
end
