Rails.application.routes.draw do
  root 'requisitions#index'
  get    '/login',  to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'  

  resources :users do
    member do
      resources :profile
    end
  end

  resources :requisitions
  resources :personal_references, only: [:show]
end
