Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # resources :organizations do
  #   resources :contacts, only: [ :new, :create ]
  # end
  # get "contacts", to: "contacts#index"
  resources :organizations
  resources :contacts
end
