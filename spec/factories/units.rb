FactoryBot.define do
  factory :unit do
    image { "image.jpeg" }
    colour { "Red" }
    price { 79.99 }
    size { 6 }
    quantity { 10 }
    product { create(:product) }
  end
end
