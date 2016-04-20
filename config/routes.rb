Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  root 'pages#home'
  get 'hall' => 'pages#hall'
  get 'instructs' => 'pages#instructs'
  
end
