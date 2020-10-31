class BasketItem < ApplicationRecord
  validates :basket_id, :unit_id, :quantity, presence: true
  belongs_to :basket
  belongs_to :unit
end
