Rails.application.routes.draw do
  get 'user_reports/new'
  get 'user_reports/create'
  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth' }
  root "posts#index"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    collection do
      post :index, :feed, :maps
    end
    resources :comments, only: [:create, :update, :destroy]
  end
  resources :user_reports, only: [:new, :create]
  post '/posts/:id/like' => 'posts#like', as: :like_post
  post '/posts/:id/dislike' => 'posts#dislike', as: :dislike_post
  post '/posts/:id/favorite' => 'posts#favorite', as: :favorite_post
  resources :relationships,       only: [:create, :destroy]
  get '/users/:id/show_favorite', to: 'posts#show_favorite', as: :favorite_show
  get '/feed', to: 'posts#feed'
  get '/maps', to: 'posts#maps'
  get '/maps/:title', to: 'posts#maps'
  get '/info', to: 'posts#info'
end