# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :plans do
    resources :features
  end
  resources :users, only: %i[index show]
  resources :subscriptions, only: %i[new create destroy]
  resources :usages
  resources :transactions, only: %i[index]
  get 'subscription/success', to: 'subscriptions#success'
  post 'billing_portal/create', to: 'billing_portal#create'
end
