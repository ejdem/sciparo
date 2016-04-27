Rails.application.routes.draw do

  root 'pages#home'

  get 'instructs' => 'pages#instructs'
  
  get  'play'   => 'sessions#new'
  post 'play'   => 'sessions#create'
  get  'finish' => 'sessions#destroy'
  # routes for different views in hall of fame.
  get 'users/index/wins' =>    'users#wins'
  get 'users/index/points' =>  'users#points'
  get 'users/index/streaks' => 'users#streaks'
  get 'hall_of_fame'        => 'users#index'
  resources :users,   only: [ :new, :create]
  resources :matches, only: [:index, :new, :create, :show]
  resources :carts,   only: [:show]
end
