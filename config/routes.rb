Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Lists

  # get "lists", to: "lists#index"
  # get "lists/new", to: "lists#new"
  # get "lists/:id", to: "lists#show"
  # post "lists", to: "lists#create"

  # get "bookmarks/new", to: "bookmarks#new"
  # post "bookmarks", to: "bookmarks#create"

  # Bookmarks
  resources :lists, only: [ :index, :show, :create, :new ] do
    
    resources :bookmarks, only: [ :new, :create ]
  end

  resources :bookmarks, only: :destroy
end
