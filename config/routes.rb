Rails.application.routes.draw do
  resources :order_item, only: :create
  resources :catalog, only: :index
  resources :cart, only: [:update, :index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: :show
  root 'home#index'
end
