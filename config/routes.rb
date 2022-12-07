Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks" }
  root "posts#index"
  resources :users
  resources :posts do
    resources :comments, only: [:new, :create, :edit, :destroy, :update]
  end

  get "/operations/save_posts", to: "operations#save_posts"
  put 'posts/:id/like', to: 'posts#like', as: 'like'
  put 'posts/:id/dislike', to: 'posts#dislike', as: 'dislike'

end