class MealPlan < ApplicationRecord
  validates :start_date, :end_date, presence: true
end
