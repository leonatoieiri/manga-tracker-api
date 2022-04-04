Rails.application.routes.draw do
  resources :user_mangas
  resources :volumes
  resources :mangas
  resources :authors
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
