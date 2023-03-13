Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "pages#home"

  as :user do
    get '/dashboard', to: 'pages#dashboard', as: :user_root
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard"
  get "/trending", to: "pages#trending"
  get "/search", to: "pages#search"

  # Defines the root path route ("/")
  # root "articles#index"
  resources :polls do
    resources :votes, only: :create
  end

  resources :votes, only: [] do
    resources :comments, only: %i[create]
  end

  resources :user_categories, only: %i[new create]
  resources :categories, only: [:index, :show]
end
