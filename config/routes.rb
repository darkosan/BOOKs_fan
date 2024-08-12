Rails.application.routes.draw do
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  namespace :admin do
    resources :users, only: %i(index destroy)
    resources :books, only: %i(index destroy)
  end

  resources :users, only: %i(index show)
  resources :books

  resources :genres, only: %i(new create index edit update destroy)

end
