Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'

  resources :searches, only: %i[ new create ]

  authenticate :user, ->(user) { user.admin? } do
    get 'analytics', to: 'analytics#index'
  end
end
