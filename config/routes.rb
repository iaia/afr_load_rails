Rails.application.routes.draw do
    root to: "tv_programs#index"

    resources :actor_thumbnails
    resources :movie_thumbnails

    resources :movies
    resources :tv_programs
    get "tv_programs/:year/:month", to: "tv_programs#index"

    resources :directors
    resources :actors
    resources :users

    resources :watched_tv_programs
    resources :watched_movies
    resources :recordeds

    get 'auth/google_oauth2/callback', to: 'omniauth_callbacks#google_callback'
    get 'auth/twitter/callback', to: 'omniauth_callbacks#twitter_callback'
    get "auth/failure" => "sessions#failure"

    get "login" => "sessions#new"
    post "login" => "sessions#create"
    get "logout" => "sessions#destroy"
end

