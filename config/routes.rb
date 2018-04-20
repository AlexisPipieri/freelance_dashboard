Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get "/dashboard", to: "users#dashboard", as: "dashboard"
  get '/dashboard', to: 'pages#dashboard' , as: "dashboard"

  resources :users, only: [:show, :edit, :update]
  resources :organizations
  resources :contacts do
    resources :notes, only: [ :create, :destroy ]
  end
  get :contacts, to: "contacts#index", as: :search_contacts

  resources :quotes, only: [ :index, :new, :create ] do
    get :export_pdf, on: :member
  end

end
