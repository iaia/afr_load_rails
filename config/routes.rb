Rails.application.routes.draw do
    root to: "tv_programs#index"

    resources :movies
    resources :tv_programs
    get "tv_programs/:year/:month", to: "tv_programs#index"

    resources :directors
    resources :actors

end
