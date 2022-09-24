Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :plans do
    resources :features
  end
  resources :users, only: %i[index show]
  resources :subscriptions, only: %i[new create destroy]
  resources :usages
  resources :transactions, only: %i[index create]
  get 'subscription/success', :to => 'subscriptions#success'
end
