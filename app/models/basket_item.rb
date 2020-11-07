class BasketItem < ApplicationRecord
  validates :basket_id, :unit_id, :quantity, presence: true
  belongs_to :basket
  belongs_to :unit

  def subtotal_price
    unit.product.price.to_i * quantity.to_i
  end

  def validate_stock
    if quantity <= unit.quantity
      true
    else
      destroy
      false
    end
  end
end
