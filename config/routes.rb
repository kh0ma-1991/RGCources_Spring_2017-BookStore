Rails.application.routes.draw do
  resources :checkout#, only: [:show, :update]
  resources :orders, only: :update
  resources :order_items, only: [:create, :update, :destroy]
  resources :catalog, only: :index
  resources :cart, only: :index

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: :show
  root 'home#index'
end
