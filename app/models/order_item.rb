class OrderItem < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :unit
  validates :order_id, :unit_id, :quantity, presence: true
end
