Rails.application.routes.draw do
  root to:'homes#top'
  resources :users

  resources :users do
    resources :posts
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end