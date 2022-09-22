Rails.application.routes.draw do
  resources :plans do
    resources :features
  end
  devise_for :users
  root to: 'home#index'
end
