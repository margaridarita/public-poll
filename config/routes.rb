Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard"
  get "/trending", to: "pages#trending"
  get "/my_account", to: "pages#my_account"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :polls do
    resources :votes, only: :create
  end

  resources :votes, only: [] do
    resources :comments, only: %i[create]
  end

  resources :user_categories, only: %i[new create]
  #resources :comments, only: %i[edit update show destroy]
end
