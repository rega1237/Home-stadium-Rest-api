Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/auth/login', to: 'authentication#login'
  resources :users do
    resources :reservations
  end

  resources :stadiums do
    resources :games
  end

  resources :teams, only: [:index] do
  end
end
