Rails.application.routes.draw do
  get 'answers/new'
  root to:'homes#top'
  resources :users
  resources :posts
  resources :answers

  resources :users do
    resources :posts
    delete '/trush', to:'posts#destroy'
  end

  resources :posts do
    resources :answers
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
