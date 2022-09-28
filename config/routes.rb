Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/auth/login', to: 'authentication#login'
  resources :users, only: [:create] do
    resources :reservations, only: %i[index create destroy show] 
  end

  resources :stadiums, only: %i[index create show destroy] do
    resources :games, only: %i[create show destroy]
  end

  resources :teams, only: [:index] do
  end
end
