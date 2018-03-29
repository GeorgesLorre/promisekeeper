Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # root to: 'pages#home'
  get '/privacy', to: 'pages#privacy'
  root to: 'promises#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :promises
end
