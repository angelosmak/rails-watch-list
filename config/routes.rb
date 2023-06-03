Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  # Defines the root path route ("/")
  resources :lists, only: [:show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create,:destroy]
  end
end
