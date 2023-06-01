Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "movies#index"
  resources :movies-d postgresql
  # Defines the root path route ("/")
  # root "articles#index"
end
