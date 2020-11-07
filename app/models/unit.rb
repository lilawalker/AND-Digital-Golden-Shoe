class Unit < ApplicationRecord
  belongs_to :product
  validates :serial_number, :size, :quantity, :product_id, presence: true

  def decrement_quantity
    decrement!(:quantity)
  end
end
