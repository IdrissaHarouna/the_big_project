Rails.application.routes.draw do
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome'
  



  resources :gossips do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  # Page d’accueil
  root "gossips#index"

  # Pages statiques
  
  get '/welcome/:first_name', to: 'static_pages#welcome'

   

  # Ressources principales
  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end


  resources :users, only: [:show]
  resources :cities, only: [:show]

  





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
