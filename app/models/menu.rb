# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :recipe
end
