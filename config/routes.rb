Rails.application.routes.draw do
  root to:'homes#top'
  resources :users
  resources :posts


  resources :users do
    resources :posts
    delete '/trush', to:'posts#destroy'
  end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
