require 'rails_helper'

RSpec.describe Product, type: :model do

  subject(:product) { FactoryBot.create(:product) }

  it 'is not valid without a category' do
    product.category = nil
    expect(product).to_not be_valid
  end

  it 'is not valid without a style' do
    product.style = nil
    expect(product).to_not be_valid
  end

  it 'is not valid without a name' do
    product.name = nil
    expect(product).to_not be_valid
  end

  it 'is not valid without a description' do
    product.description = nil
    expect(product).to_not be_valid
  end

end
