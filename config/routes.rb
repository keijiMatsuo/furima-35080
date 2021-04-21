Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  resources :listings do
    resources :purchases, only: :index
  end
end
