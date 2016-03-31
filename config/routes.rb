Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'connections#create'
  get 'auth/failure', to: 'connections#omniauth_failure'


  resources :connections, only: [:destroy]

  devise_for :users, controllers: {registrations: 'registrations'}
  get 'pages/home'
  root 'pages#home'
  get 'dashboard' => 'pages#dashboard'
end
