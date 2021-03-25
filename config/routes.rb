Rails.application.routes.draw do
  resources :recipes
  resources :meal_plans, only: [:new, :index, :show, :create]
  root 'dashboard#index'
  get 'dashboard/index'
end
