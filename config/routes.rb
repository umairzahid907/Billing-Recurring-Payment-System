Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :plans do
    resources :features
  end
  root to: 'home#index'
end
