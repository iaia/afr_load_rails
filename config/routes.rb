Rails.application.routes.draw do
    root to: "tv_program#index"
    resources :tv_program
    get "tv_program/index"
    get "tv_program/:year/:month", to: "tv_program#index"
end
