Rails.application.routes.draw do
  root to: 'users#new'
  get 'home/about' => 'users#about'
  get 'users/top' => 'users#top'
  get 'users/home' =>'users#home'
  get 'users/detail' => 'users#detail'
  devise_for :users
  resources :users
  resources :books

  resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
