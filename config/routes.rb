Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#home'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
 
  resources :animals  do
    resources :reasons, only: [:new, :create, :index] 
  end

resources :sessions, only: [:new, :create, :destroy, :show]

resources :users, only: [:new, :create, :show]

resources :categories, only: [:new, :create, :show]

end

