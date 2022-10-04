Rails.application.routes.draw do
  root "posts#index"

  resources :posts , only: [:index, :new, :create, :edit, :destroy, :update] do
    resources :comments, only: [:new, :create, :edit, :destroy, :update]
  end
  resources :users
end