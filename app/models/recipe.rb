class Recipe < ApplicationRecord
  has_many :menus
  has_many :meal_plans, through: :menus

  has_one_attached :image
  
  validates :title, :instructions, presence: true
end
