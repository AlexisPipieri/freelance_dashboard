Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :organizations
  resources :contacts do
    resources :notes, only: [ :create, :destroy ]
  end
  get :contacts, to: "contacts#index", as: :search_contacts
end
