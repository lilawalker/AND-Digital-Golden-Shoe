FactoryBot.define do
  factory :order_item do
    order { create(:order) }
    unit { create(:unit) }
    quantity { 1 }
  end
end
