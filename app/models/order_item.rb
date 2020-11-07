class OrderItem < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :unit
  validates :order_id, :unit_id, :quantity, presence: true
  after_create :decrement_unit_quantity

  private

  def decrement_unit_quantity
    unit.decrement_quantity
  end

end
