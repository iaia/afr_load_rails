Rails.application.routes.draw do
  resources :actor_thumbnails
  resources :movie_thumbnails
  get 'sessions/new'

    root to: "tv_programs#index"

    resources :movies
    resources :tv_programs
    get "tv_programs/:year/:month", to: "tv_programs#index"

    resources :directors
    resources :actors
    resources :users

    get "login" => "sessions#new"
    post "login" => "sessions#create"
    get "logout" => "sessions#destroy"

    resources :watched_tv_programs
    resources :watched_movies
    resources :recordeds


end
