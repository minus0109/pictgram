Rails.application.routes.draw do
  get 'comments/new'
  post '/favorites', to: 'favorites#create'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  resources :users
  resources :topics do
    resources :comments
  end
  resources :favorites

  get		'/login',	to: 'sessions#new'
  post		'/login',	to: 'sessions#create'
  delete	'/logout',	to: 'sessions#destroy'
end
