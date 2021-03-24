class MealPlan < ApplicationRecord
  has_many :menus
  has_many :recipes, through: :menus
end
