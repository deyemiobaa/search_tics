Rails.application.routes.draw do
  devise_for :users

  root "devise/sessions#new"

  authenticated :user do
    root 'homepages#index', as: :authenticated_root
  end
end
