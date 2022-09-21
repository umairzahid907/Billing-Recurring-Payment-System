Rails.application.routes.draw do
  resources :plans
  devise_for :users
  root to: 'home#index'
end
