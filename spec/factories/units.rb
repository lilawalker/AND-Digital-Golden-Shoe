FactoryBot.define do
  factory :unit do
    serial_number { "MC12HN" }
    size { 6 }
    quantity { 10 }
    product { create(:product) }
  end
end
