class Recipe < ApplicationRecord
  has_one_attached :image
  
  validates :title, :instructions, presence: true
end
