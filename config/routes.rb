Rails.application.routes.draw do
  root 'pages#home'
  get 'hall' => 'pages#hall_of_fame'
  
end
