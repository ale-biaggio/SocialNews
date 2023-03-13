Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth' }
  root "posts#index"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end
  post '/posts/:id/like' => 'posts#like', as: :like_post
  post '/posts/:id/dislike' => 'posts#dislike', as: :dislike_post
  resources :relationships,       only: [:create, :destroy]
  get '/feed', to: 'posts#feed'
end