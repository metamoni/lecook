# frozen_string_literal: true

class MealPlan < ApplicationRecord
  include ActiveModel::Validations
  validates_with DateValidator

  has_many :menus
  has_many :recipes, through: :menus

  accepts_nested_attributes_for :recipes

  validates :start_date, :end_date, presence: true
end
