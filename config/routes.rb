# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'
  }
  get '/member-data', to: 'members#show'

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :users do
    resources :personal_gearboxes
    resources :personal_replicas
    resources :items
  end
  resources :barrels
  resources :hop_up_units
  resources :joint_hop_ups
  resources :nozzles
  resources :spring_guides
  resources :springs
  resources :cylinder_heads
  resources :cylinders
  resources :piston_heads
  resources :pistons
  resources :gearboxes
  resources :replicas

  # Defines the root path route ("/")
  # root "articles#index"
end
