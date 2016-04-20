Rails.application.routes.draw do
  root 'pages#home'
  get 'hall' => 'pages#hall'
  get 'instructs' => 'pages#instructs'
  
end
