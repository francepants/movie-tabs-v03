Rails.application.routes.draw do
  root 'sessions#home'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  #nested routes
  resources :reviews
  
  resources :movies do
    resources :reviews
  end
  
  resources :users do
    resources :reviews, only: [:new, :create, :index]
  end
  
  # get '/auth/:google_oath2/callback' => 'sessions#omniauth'
  get '/auth/:google_oath2/callback' => 'sessions#google'


  #redirects if no route exists
  get '*path' => redirect('/')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
