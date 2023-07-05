Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" 

  post '/signup', to: 'users#create'
  post '/auth/login', to: 'sessions#create'
  get '/auth/logout', to: 'sessions#destroy'
  get '/tasks', to: 'tasks#index'
  post '/tasks', to: 'tasks#create'
  get '/tasks/:id', to: 'tasks#show'
  put '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy'
  post '/auth/profile', to: 'user_profiles#create'
  get '/auth/profile', to: 'user_profiles#show'
  put '/auth/profile', to: 'user_profiles#update'
end
