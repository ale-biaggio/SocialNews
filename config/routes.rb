Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "posts#index"

  resources :posts , only: [:index, :new, :create, :edit, :destroy, :update] do
    resources :comments, only: [:new, :create, :edit, :destroy, :update]
  end
end