# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipes
  resources :meal_plans, only: %i[new index show create]
  root 'dashboard#index'
  get 'dashboard/index'
end
