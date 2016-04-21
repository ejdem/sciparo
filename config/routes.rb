Rails.application.routes.draw do

  root 'pages#home'

  get 'instructs' => 'pages#instructs'
  
  get  'play'   => 'sessions#new'
  post 'play'   => 'sessions#create'
  get  'finish' => 'sessions#destroy'
  
  resources :users,   only: [:index, :new, :create]
  resources :matches, only: [:index, :new, :create, :show]
  resources :carts,   only: [:show]
end
