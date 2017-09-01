Rails.application.routes.draw do
  get 'books/show'

  get 'book/show'

  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'home'
  root 'home#index'
end
