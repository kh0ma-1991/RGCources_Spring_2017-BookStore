Rails.application.routes.draw do
  get 'catalog/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: :show
  root 'home#index'
end
