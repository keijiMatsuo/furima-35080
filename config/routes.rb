Rails.application.routes.draw do
  get 'listings/index'
  devise_for :users
  root to: "listings#index"
  end
