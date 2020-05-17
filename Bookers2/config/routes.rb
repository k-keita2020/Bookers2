Rails.application.routes.draw do
  get 'home/index'
  get 'home/about' => "home#show"
  root to: "home#index"
  resources :books
  devise_for :users
  resources :users, only: [:index,:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
