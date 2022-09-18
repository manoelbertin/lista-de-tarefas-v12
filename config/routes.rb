Rails.application.routes.draw do
  resources :assignments, only: [:index, :create, :update, :destroy]

  root "assignments#index"
end
