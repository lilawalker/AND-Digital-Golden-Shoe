require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  subject(:order_item) { FactoryBot.create(:order_item) }

  it 'is not valid without a order id' do
    order_item.order_id = nil
    expect(order_item).to_not be_valid
  end

  it 'is not valid without a unit id' do
    order_item.unit_id = nil
    expect(order_item).to_not be_valid
  end

  it 'is not valid without a quantity' do
    order_item.quantity = nil
    expect(order_item).to_not be_valid
  end

end
