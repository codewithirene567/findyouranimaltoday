Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :animals  do
  resources :reasons, only: [:new, :create, :index] 
end

end

