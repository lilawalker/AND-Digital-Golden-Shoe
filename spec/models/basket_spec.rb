require 'rails_helper'

RSpec.describe Basket, type: :model do

  subject(:basket) { FactoryBot.create(:basket) }
  let(:unit) { FactoryBot.create(:unit) }

  it 'is not valid without a uuid' do
    basket.uuid = nil
    expect(basket).to_not be_valid
  end

  it 'adds the unit to the basket' do
    basket.add_unit(unit)
    expect(basket.basket_items.length).to eq 1
  end

  it 'increments the quantity if mulitple of same item added' do
    basket.add_unit(unit)
    basket.add_unit(unit)
    expect(basket.basket_items.first.quantity).to eq 2
  end

end
