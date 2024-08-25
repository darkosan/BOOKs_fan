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
    resources :genres, only: %i(new create index edit update destroy)
  end

  resources :users, only: %i(index show)
  resources :books do
    resources :post_comments, only: %i(create destroy)
    resource :favorite, only: %i(create destroy)
  end

  resources :genres, only: %i(index) do
    resources :genre_books, only: %i(index)
  end

  get "search" => "searches#search"

end
