Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [ :index, :show, :edit, :update] do
    resources :services
    resources :appointments, only: [ :create ]
    resources :pages
    resources :reviews

  end
  get '/appointments/:barber_id/new', to: 'appointments#new', as: :new_appointment
  get '/my_appointments', to: 'appointments#index', as: :my_appointments
  get '/my_services/:barber_id', to: 'services#index', as: :my_services
  resources :reviews

  resources :chatrooms, only: [:show, :create, :new] do
    resources :messages, only: :create
  end
end
