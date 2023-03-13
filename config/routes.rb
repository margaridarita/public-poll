Rails.application.routes.draw do
  get 'searches/create'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "pages#home"

  as :user do
    get '/dashboard', to: 'pages#dashboard', as: :user_root
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard"
  get "/trending", to: "pages#trending"
  get "/search", to: "pages#search"
  delete "/searches/:id", to: "pages#delete_search", as: :delete_search
  get "/categories", to: "pages#categories"
  get '/categories/:title', to: 'categories#show'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :polls do
    resources :votes, only: :create
    resources :bookmarks, only: %i[create]
  end

  resources :bookmarks, only: [:destroy]

  resources :votes, only: [] do
    resources :comments, only: %i[create]
  end

  resources :user_categories, only: %i[new create]

  resources :categories, only: [:index, :show]
end
