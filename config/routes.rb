Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # resources :user, only: [ :create, :new, :edit ] do
  #   resources :services, :time_slots, :appointments, :favorites, :reviews
  # end
  # resources :user, only: [ :index, :show ]
  resources :chatroom, only: [ :index, :show ]
  resources :messages, only: [ :index, :create ]

  resources :services, only: [ :index, :show ]
  resources :time_slots, only: [ :index, :show ]
  resources :reviews, only: [ :index, :show ]
end
