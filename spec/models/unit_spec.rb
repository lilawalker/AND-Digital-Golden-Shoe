require 'rails_helper'

RSpec.describe Unit, type: :model do

  subject(:unit) { FactoryBot.create(:unit) }

  it 'is not valid without a serial number' do
    unit.serial_number = nil
    expect(unit).to_not be_valid
  end

  it 'is not valid without a size' do
    unit.size = nil
    expect(unit).to_not be_valid
  end

  it 'is not valid without a quantity' do
    unit.quantity = nil
    expect(unit).to_not be_valid
  end

  it 'is not valid without a product_id' do
    unit.product_id = nil
    expect(unit).to_not be_valid
  end

  it '#decrement_quantity' do
    expect { unit.decrement_quantity }.to change { unit.quantity }.from(10).to(9)
  end

end
