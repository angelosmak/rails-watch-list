Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  # Defines the root path route ("/")
  resources :lists, only:["index","create","update"]
  # root "articles#index"
  resources :bookmarks, only:["new","show", "create","destroy"]
end
