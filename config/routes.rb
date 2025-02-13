Rails.application.routes.draw do
  get 'daily_logs/index'
  get 'daily_logs/show'
  get 'daily_logs/new'
  get 'daily_logs/create'
  get 'daily_logs/edit'
  get 'daily_logs/update'
  get 'daily_logs/destroy'
  devise_for :users
  root to: "pages#home"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
