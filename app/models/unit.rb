class Unit < ApplicationRecord
  belongs_to :product
  validates :image, :colour, :price, :size, :quantity, :product_id, presence: true
end
