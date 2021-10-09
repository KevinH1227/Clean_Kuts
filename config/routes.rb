Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :client, only: [ :index, :show, :create, :new, :edit ]
  resources :barber, only: [ :show, :create, :new, :edit ]
end
