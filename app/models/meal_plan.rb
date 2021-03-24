class MealPlan < ApplicationRecord
  has_many :menus
  has_many :recipes, through: :menus

  accepts_nested_attributes_for :menus
end
