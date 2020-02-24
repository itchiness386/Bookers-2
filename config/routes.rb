Rails.application.routes.draw do
  get 'search/search'
  root to: 'home#index'
  get "home/about"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'user/:id/follows' => 'relationships#follows', as: 'follows'
  get 'user/:id/followers' => 'relationships#followers', as: 'followers'
  get '/search' => 'search#search'
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
