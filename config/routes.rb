Rails.application.routes.draw do
  resources :books, only: :show
  root 'home#index'
end
