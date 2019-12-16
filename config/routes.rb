Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'users/index'
  get 'users/show'
  devise_for :users
  get 'topics/new'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users, only: [:index, :show]
  resources :topics
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end
  
  root 'posts#index'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  
  # 書いたコード
  post"favorite/:post_id/destroy" => "favorites#destroy"
end