Rails.application.routes.draw do
  get 'users/show'
  get 'gossips/index'
  get 'gossips/show'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome'
  root 'gossips#index'

  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:first_name', to: 'static_pages#welcome', as: 'welcome'

  resources :gossips, only: [:index, :show, :new, :create]  
  resources :users, only: [:show]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
