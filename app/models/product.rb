class Product < ApplicationRecord
  validates :category, :style, :name, :description, :image, :colour, :price, presence: true
  has_many :units
end
