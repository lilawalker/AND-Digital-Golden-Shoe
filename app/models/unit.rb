class Unit < ApplicationRecord
  belongs_to :product
  validates :serial_number, :size, :quantity, :product_id, presence: true
end
