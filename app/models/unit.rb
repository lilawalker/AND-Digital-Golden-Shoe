class Unit < ApplicationRecord
  belongs_to :product
  validates :serial_number, :image, :colour, :price, :size, :quantity, :product_id, presence: true
end
