require 'rails_helper'

RSpec.describe BasketItem, type: :model do

  subject(:basket_item) { FactoryBot.create(:basket_item) }

  it 'is not valid without a unit id' do
    basket_item.unit_id = nil
    expect(basket_item).to_not be_valid
  end

  it 'is not valid without a basket id' do
    basket_item.basket_id = nil
    expect(basket_item).to_not be_valid
  end

  it 'is not valid without a quantity' do
    basket_item.quantity = nil
    expect(basket_item).to_not be_valid
  end

end
