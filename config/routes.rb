Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Un utilisateur peut voir toutes les listes
  # GET "lists"
  resources :lists, only: [ :index, :show, :new, :create ] do
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: [ :destroy ]
  # Un utilisateur peut voir les détails d’une liste donnée et son nom
  # GET "lists/42"
  # Un utilisateur peut créer une nouvelle liste
  # GET "lists/new"
  # POST "lists"

end
