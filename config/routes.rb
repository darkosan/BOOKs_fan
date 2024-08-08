Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  root to: "homes#top"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  get "homes/about" => "homes#about", as: "about"

  resources :users, only: [:index, :show]
  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
