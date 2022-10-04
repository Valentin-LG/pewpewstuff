Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
