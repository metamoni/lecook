# frozen_string_literal: true

class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
