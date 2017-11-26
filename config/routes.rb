Rails.application.routes.draw do
  get '/users/edit', to: 'privacy#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :checkout
  resources :orders, only: [:index, :update, :show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :catalog, only: :index
  resources :cart, only: :index
  scope :settings, only: :index do
    resources :privacy, only: :index do
      member do
        patch 'update_email'
        patch 'update_password'
      end
    end
    resources :address, only: :index do
      member do
        patch 'update_shipping'
        patch 'update_billing'
      end
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: :show
  root 'home#index'
end
