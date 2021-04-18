Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  resources :listings, only: [:new, :create]
end
