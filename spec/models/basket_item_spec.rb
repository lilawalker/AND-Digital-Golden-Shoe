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

  it "#subtotal_price" do
    expect(basket_item.subtotal_price).to eq 79
  end

  context "#validate_stock" do
    it "returns true if the item is in stock" do
      expect(basket_item.validate_stock).to eq true
    end

    it "returns false if the item is not in stock" do
      basket_item.unit.quantity = 0
      expect(basket_item.validate_stock).to eq false
    end
  end

end
