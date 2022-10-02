Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments, only: [:new, :create, :edit, :destroy, :update]
  end
  resources :users
end