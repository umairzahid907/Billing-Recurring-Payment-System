Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :plans do
    resources :features
  end

  root to: 'home#index'
  resources :subscriptions, only: %i[create destroy]
  resources :usages
  resources :users
  resources :transactions, only: %i[index create]
end
