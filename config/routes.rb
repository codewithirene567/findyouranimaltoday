Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#home'
  resources :animals  do
    resources :reasons, only: [:new, :create, :index] 
end
resources :sessions, only: [:new, :create, :destroy]

resources :users, only: [:new, :create, :show]

#resources :reasons, only: [:new, :create]


end

