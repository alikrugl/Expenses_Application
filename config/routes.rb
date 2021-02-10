Rails.application.routes.draw do

  resources :subscribers
  resources :expenses

  get 'expenses', to: "expenses#new"

  get "password", to: "passwords#edit", as: :edit_password 
  patch "password", to: "passwords#update"

  get 'sign_up', to: "registrations#new"
  post 'sign_up', to: "registrations#create"

  get 'sign_in', to: "sessions#new"
  post 'sign_in', to: "sessions#create"

  delete 'logout', to: "sessions#destroy"

  root to: "main#index"
end