Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :books
    get 'users/about' => 'users#about'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
