class Recipe < ApplicationRecord
  validates :title, :instructions, presence: true
end
