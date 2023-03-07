Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard"
  get "/my_account", to: "pages#my_account"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :polls do
    resources :comments, only: %i[index new create]
  end
  resources :comments, only: %i[edit update show destroy]
end
