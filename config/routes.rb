Rails.application.routes.draw do
  devise_for :users, controller: {registrations: 'registrations'}
  get 'pages/home'
  root 'pages#home'
end
