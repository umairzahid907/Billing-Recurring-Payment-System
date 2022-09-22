Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :plans
  root to: 'home#index'
end
