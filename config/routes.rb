Rails.application.routes.draw do
  resources :recipes
  root 'dashboard#index'
  get 'dashboard/index'
end
