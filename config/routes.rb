Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  
  # 書いたコード
  post"favorite/:post_id/destroy" => "favorites#destroy"
end