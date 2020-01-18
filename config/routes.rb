Rails.application.routes.draw do
  root to: 'home#index'
  get "home/about"
  devise_for :users
  resources :users, only: [:index, :show, :edit]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
