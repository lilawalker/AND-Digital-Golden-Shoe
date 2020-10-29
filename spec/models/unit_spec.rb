require 'rails_helper'

RSpec.describe Unit, type: :model do

  subject(:unit) { FactoryBot.create(:unit) }

  it 'is not valid without a serial_number' do
    unit.serial_number = nil
    expect(unit).to_not be_valid
  end

  it 'is not valid without a image' do
    unit.image = nil
    expect(unit).to_not be_valid
  end

  it 'is not valid without a colour' do
    unit.colour = nil
    expect(unit).to_not be_valid
  end

  it 'is not valid without a price' do
    unit.price = nil
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

end
