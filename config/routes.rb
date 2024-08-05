Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  get "homes/about" => "homes#about", as: "about"

  resources :users, only: [:index, :show]
  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
