class Basket < ApplicationRecord
  validates :uuid, presence: true
  has_many :basket_items, dependent: :destroy

  def add_unit(unit)
    current_item = basket_items.find_by(unit_id: unit.id)

    if current_item
      current_item.increment!(:quantity)
    else
      current_item = basket_items.create(unit_id: unit.id)
    end

    current_item
  end

  def validate_stock
    basket_items.map(&:validate_stock).uniq == [true]
  end
end
