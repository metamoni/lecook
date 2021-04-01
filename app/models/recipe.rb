# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients
  has_many :menus
  has_many :meal_plans, through: :menus

  validates :title, :instructions, presence: true
end
