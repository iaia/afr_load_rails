Rails.application.routes.draw do
  root to: "tv_programs#index"

  resources :movie_countries

  resources :actor_thumbnails
  resources :movie_thumbnails

  resources :movies do
    collection do
      get "title_search"
    end
  end
  resources :tv_programs do
    get :comments, :index, to: "comments#index"
  end
  get "tv_programs/:year/:month", to: "tv_programs#index"

  resources :directors
  resources :countries
  resources :actors
  resources :users

  resources :watched_tv_programs
  resources :watched_movies
  resources :recordeds

  get "auth/google/callback", to: "omniauth_callbacks#google_callback"
  get "auth/twitter/callback", to: "omniauth_callbacks#twitter_callback"
  get "auth/github/callback", to: "omniauth_callbacks#github_callback"
  get "auth/facebook/callback", to: "omniauth_callbacks#facebook_callback"
  get "auth/failure" => "sessions#failure"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  get "login_mobile" => "sessions#login_mobile"
end
