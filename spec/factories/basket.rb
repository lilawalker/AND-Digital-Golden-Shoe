FactoryBot.define do
  factory :basket do
    uuid { "987654321" }
    subtotal { 10 }
    discount { 0 }
    total { 10 }
  end
end
