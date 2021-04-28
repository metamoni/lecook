# frozen_string_literal: true

Rails.application.routes.draw do
  resources :ingredients, only: %i[new index create destroy]
  resources :recipes
  resources :meal_plans
  root 'recipes#index'
  get 'dashboard/index'
end
