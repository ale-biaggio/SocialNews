Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks" }
  root "posts#index"
  resources :users
  resources :posts do
    resources :comments, only: [:new, :create, :edit, :destroy, :update]
  end
  post '/posts/:id/like' => 'posts#like', as: :like_post
  post '/posts/:id/dislike' => 'posts#dislike', as: :dislike_post

end