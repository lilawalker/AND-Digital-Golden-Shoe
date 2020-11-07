require 'rails_helper'

RSpec.describe Order, type: :model do

  subject(:order) { FactoryBot.create(:order) }

  it 'is not valid without a status' do
    order.status = nil
    expect(order).to_not be_valid
  end

  it 'is not valid without a user id' do
    order.user_id = nil
    expect(order).to_not be_valid
  end

  it 'is not valid without a subtotal' do
    order.subtotal = nil
    expect(order).to_not be_valid
  end

  it 'is not valid without a total' do
    order.total = nil
    expect(order).to_not be_valid
  end

end
