class Product < ApplicationRecord
  validates :category, :style, :name, :description, presence: true
  has_many :units
end
