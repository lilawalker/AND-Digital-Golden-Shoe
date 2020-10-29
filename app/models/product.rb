class Product < ApplicationRecord
  validates :category, :style, :name, :description, presence: true
end
