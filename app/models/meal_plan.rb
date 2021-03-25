class MealPlan < ApplicationRecord
  has_many :menus
  has_many :recipes, through: :menus

  accepts_nested_attributes_for :recipes

  validates :start_date, :end_date, presence: true
  validate :date_not_past

  def date_not_past
    if start_date.present? && start_date < Date.today || end_date.present? && end_date < Date.today
      errors.add(:start_date, "can't be in the past")
      errors.add(:end_date, "can't be in the past")
    end
  end    
end
