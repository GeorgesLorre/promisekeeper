Rails.application.routes.draw do

  get "dashboard", to: "pages#dashboard"

  get "friends", to: "pages#friends"

  get "home", to: "pages#home"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # root to: 'pages#home'
  get '/privacy', to: 'pages#privacy'

  root to: 'promises#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :promises
end
