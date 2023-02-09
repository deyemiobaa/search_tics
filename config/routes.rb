Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'

  resources :searches, only: %i[ new create ]
end
