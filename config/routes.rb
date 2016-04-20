Rails.application.routes.draw do

  root 'pages#home'
  
  get 'hall'      => 'pages#hall'
  get 'instructs' => 'pages#instructs'
  
  get  'play'   => 'sessions#new'
  post 'play'   => 'sessions#create'
  get  'finish' => 'sessions#destroy'
  
  resources :users
  resources :matches
  resources :carts, only: [:show]
end
