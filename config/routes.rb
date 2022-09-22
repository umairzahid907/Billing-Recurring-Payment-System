Rails.application.routes.draw do
  resources :plans do
    resources :features
  end
  devise_for :users, controllers: { invitations: 'invitations' }
  root to: 'home#index'
  resources :subscriptions, only: %i[create destroy]
  resources :usages
end
